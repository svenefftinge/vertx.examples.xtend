package vertx.examples.echo

import org.vertx.java.deploy.Verticle
import static org.vertx.java.core.streams.Pump.*

class EchoServer extends Verticle {

  override start() {
    vertx.createNetServer.connectHandler [
      createPump(it, it).start
    ].listen(1234)
  }

}