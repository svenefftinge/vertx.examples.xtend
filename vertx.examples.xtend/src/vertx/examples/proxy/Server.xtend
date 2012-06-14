package vertx.examples.proxy

import org.vertx.java.deploy.Verticle

class Server extends Verticle {
	
	override start() {
		vertx.createHttpServer.requestHandler [
	        println("Got request: " + uri)
	        println("Headers are: ")
	        for (key : headers.keySet) {
	          println(key + ":" + headers.get(key))
	        }
	        dataHandler [
	            println("Got data: " + it)
	        ]
	        endHandler [_|
	            response.chunked = true
	            //Now we got everything, send back some data
	            for (i : 0..10) {
	              response.write("server-data-chunk-" + i)
	            }
	            response.end
	        ]
		].listen(8282)
	}
	
}