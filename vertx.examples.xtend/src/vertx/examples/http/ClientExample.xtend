package vertx.examples.http

import org.vertx.java.deploy.Verticle

class ClientExample extends Verticle {

	override start() {
		vertx.createHttpClient => [
			port = 8080
			host = "localhost"
			getNow("/") [
	            println(headers)
	            println(trailers)
			]
		]
	}
}

