package vertx.examples.fanout

import org.vertx.java.deploy.Verticle
import java.util.Set

class FanoutServer extends Verticle {
	
	override start() throws Exception {
		val Set<String> connections = vertx.sharedData.getSet("conns")
		
		vertx.createNetServer.connectHandler[ socket |
			connections.add(socket.writeHandlerID);
	        socket.dataHandler[
	            for (String actorID : connections) {
	              vertx.eventBus().send(actorID, it)
	            }
	        ]
	        socket.closedHandler [
	            connections.remove(socket.writeHandlerID)
	        ]
		].listen(1234)	
	}
    
}