package vertx.examples.proxy

import org.vertx.java.deploy.Verticle

class ProxyServer extends Verticle {
	
	override start() throws Exception {
		val client = vertx.createHttpClient => [
			host = 'localhost'
			port = 8282
		]

	    vertx.createHttpServer.requestHandler [ req |
	    	println("Proxying request: " + req.uri)
	        client.request(req.method, req.uri) [ response |
	        	println("Proxying response: " + response.statusCode);
	            req.response.statusCode = response.statusCode;
	            req.response.headers().putAll(response.headers);
	            req.response.setChunked(true);
	            response.dataHandler [ data |
	                println("Proxying response body:" + data);
	                req.response.write(data);
	            ]
	            response.endHandler [
	                req.response.end
	            ]
	        ] => [ clientRequest |
		        clientRequest.headers.putAll(req.headers)
		        clientRequest.chunked = true
		        req.dataHandler [ data |
		            println("Proxying request body:" + data);
		            clientRequest.write(data)
		        ]
		        req.endHandler [_|
		            clientRequest.end
		        ]
	        ]
	    ].listen(8080)	
	}
}