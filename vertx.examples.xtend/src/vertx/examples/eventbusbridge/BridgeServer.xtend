package vertx.examples.eventbusbridge

import org.vertx.java.deploy.Verticle
import org.vertx.java.core.json.JsonArray
import org.vertx.java.core.json.JsonObject

class BridgeServer extends Verticle {

	override start() throws Exception {
		val server = vertx.createHttpServer();

	    // Also serve the static resources. In real life this would probably be done by a CDN
	    server.requestHandler [
	    	switch path {
	    		// Serve the index.html
	    		case '/' : 
	    			response.sendFile("eventbusbridge/index.html")
	    		// Serve the js
	    		case path.endsWith("vertxbus.js") : 
	    			response.sendFile("eventbusbridge/vertxbus.js")
	    	}
	    ]
	
	    val permitted = new JsonArray
	    permitted.add(new JsonObject) // Let everything through
	    val sockJSServer = vertx.createSockJSServer(server)
	    sockJSServer.bridge(new JsonObject => [
	    	putString("prefix", "/eventbus")	
	    ], permitted)
	
	    server.listen(8080)
	}
	
}