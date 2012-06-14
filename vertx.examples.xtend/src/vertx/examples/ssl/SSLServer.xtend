package vertx.examples.ssl

import org.vertx.java.deploy.Verticle

class SSLServer extends Verticle {

  override start() {
    vertx.createNetServer => [
    	connectHandler[
	        dataHandler [ buffer |
	            write(buffer)
	        ]
    	]
    	SSL = true
    	keyStorePath = 'server-keystore.jks'
    	keyStorePassword = 'wibble'
    	listen(1234)
    ]
  }
}