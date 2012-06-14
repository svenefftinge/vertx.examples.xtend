package vertx.examples.echo

import org.vertx.java.deploy.Verticle
import org.vertx.java.core.buffer.Buffer

class EchoClient extends Verticle {

  override start() {
    vertx.createNetClient.connect(1234, "localhost") [
      dataHandler [
        println("Net client receiving: " + it)
      ]
      //Now send some data
      for (i : 0..9) {
        val str = "hello" + i + "\n";
        print("Net client sending: " + str)
        write(new Buffer(str))
      }
    ]
  }

}