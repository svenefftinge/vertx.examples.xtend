package vertx.examples.ssl

import org.vertx.java.deploy.Verticle
import org.vertx.java.core.buffer.Buffer

class SSLClient extends Verticle {

  override start() {
    vertx.createNetClient => [
    	SSL = true
    	trustAll = true
    	connect(1234, "localhost") [
	        dataHandler [ buffer |
	            println("Net client receiving: " + buffer.toString("UTF-8"));
	        ]
	        //Now send some dataHandler
	        for (i : 0..10) {
	          val str = "hello" + i + "\n";
	          print("Net client sending: " + str);
	          it.write(new Buffer(str))
	        }
    	]
    ]
  }
}
