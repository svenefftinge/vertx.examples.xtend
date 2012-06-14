package vertx.examples.http

import org.vertx.java.deploy.Verticle

class ServerExample extends Verticle {

	override start() throws Exception {
		vertx.createHttpServer.requestHandler [
	        println("Got request: " + uri)
	        println("Headers are: ")
	        for (String key : headers.keySet) {
	          println(key + ":" + headers.get(key))
	        }
	        response.headers.put("Content-Type", "text/html; charset=UTF-8")
	        response.end("<html><body><h1>Hello from vert.x!</h1></body></html>")
		].listen(8080)
	}
	
}