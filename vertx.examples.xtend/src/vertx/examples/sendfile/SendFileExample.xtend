package vertx.examples.sendfile

import org.vertx.java.deploy.Verticle

class SendFileExample extends Verticle {

  static val webroot = "sendfile/"

  override start() {
    vertx.createHttpServer.requestHandler [
        if (path.equals("/")) {
          response.sendFile(webroot + "index.html");
        } else {
          //Clearly in a real server you would check the path for better security!!
          response.sendFile(webroot + path);
        }
    ].listen(8080)
  }
}