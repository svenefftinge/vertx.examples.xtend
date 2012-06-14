package vertx.examples.https

import org.vertx.java.deploy.Verticle

class ServerExample extends Verticle {

	override start() throws Exception {
		vertx.createHttpServer => [
			SSL = true
			keyStorePath = "server-keystore.jks"
			keyStorePassword = "wibble"
			requestHandler [
		        println("Got request: " + uri)
		        println("Headers are: ")
		        response.headers.put("Content-Type", "text/html; charset=UTF-8")
		        response.end('''
		        	<html>
		        		<body>
		        			<h1>Hello from vert.x!</h1>
		        			«FOR it : headers.entrySet»
		        				<p>«key» : «value»</p>
		        			«ENDFOR»
		        		</body>
		        	</html>
		        ''')
			]
			listen(4443)	
		]
	}
	
}