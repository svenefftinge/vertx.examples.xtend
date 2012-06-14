package vertx.examples.proxy

import org.vertx.java.deploy.Verticle

class Client extends Verticle {

  override start() {
    vertx.createHttpClient => [
      port = 8080
      host = 'localhost'
      put("/some-url") [
        dataHandler [
          println("Got response data:" + it)
        ]
      ] => [
        //Write a few chunks
        chunked = true
        for (i : 0..10) {
          write("client-data-chunk-" + i)
        }
        end
      ]
    ]
  }

}