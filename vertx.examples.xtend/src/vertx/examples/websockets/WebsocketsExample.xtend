package vertx.examples.websockets

import org.vertx.java.deploy.Verticle

class WebsocketsExample extends Verticle {

  override start() {
    vertx.createHttpServer => [
    	websocketHandler [
	        if (path == "/myapp") {
	          dataHandler [ data |
	              writeTextFrame(data.toString) // Echo it back
	          ]
	        } else {
	          reject
	        }
	    ]
		requestHandler [
	        if (path == "/") 
	        	response.sendFile("websockets/ws.html") // Serve the html
	    ]
    	listen(8080)
    ]
  }
}