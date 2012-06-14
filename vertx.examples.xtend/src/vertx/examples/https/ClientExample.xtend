package vertx.examples.https

import org.vertx.java.deploy.Verticle

class ClientExample extends Verticle {

	override start() throws Exception {
		vertx.createHttpClient => [
			SSL = true
			trustAll = true
			port = 4443
			host = "localhost"
			getNow("/") [
	            println(headers)
	            println(trailers)
			]
		]
	}
	
}