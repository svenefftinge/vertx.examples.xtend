package vertx.examples.pubsub

import org.vertx.java.deploy.Verticle
import static org.vertx.java.core.parsetools.RecordParser.*
import java.util.Set
import org.vertx.java.core.buffer.Buffer

class PubSubServer extends Verticle {
	
	override start() throws Exception {
		vertx.createNetServer().connectHandler [
			val writeHandlerID = writeHandlerID
	        dataHandler( newDelimited("\n", [
	            val line = toString.trim
	            println("Line is " + line)
	            val parts = line.split("\\,")
	            if (line.startsWith("subscribe")) {
	              println("Topic is " + parts.get(1))
	              val set = vertx.sharedData().<String>getSet(parts.get(1))
	              set += writeHandlerID
	            } else if (line.startsWith("unsubscribe")) {
	              vertx.sharedData.getSet(parts.get(1)).remove(writeHandlerID)
	            } else if (line.startsWith("publish")) {
	              println("Publish to topic is " + parts.get(1))
	              val Set<String> actorIDs = vertx.sharedData.getSet(parts.get(1))
	              for (actorID : actorIDs) {
	                println("Sending to verticle")
	                vertx.eventBus.send(actorID, new Buffer(parts.get(2)))
	              }
	            }
	        ]))
		].listen(1234)
	}
	
}