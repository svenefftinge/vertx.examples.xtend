package vertx.examples.sockjs

import org.vertx.java.deploy.Verticle
import org.vertx.java.core.json.JsonObject

class SockJsExample extends Verticle {

  override start() {
    vertx.createHttpServer => [
    	requestHandler [
	        if (path == "/") 
	        	response.sendFile("sockjs/index.html") // Serve the html
	    ]
	    vertx.createSockJSServer(it) => [
		    installApp(new JsonObject().putString("prefix", "/testapp")) [
		        dataHandler [ data |
		            writeBuffer(data) // Echo it back
		        ]
		    ]
	    ]
	    listen(8080)
    ]
  }
}