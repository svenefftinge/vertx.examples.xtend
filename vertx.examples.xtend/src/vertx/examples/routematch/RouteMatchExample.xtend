package vertx.examples.routematch

import org.vertx.java.core.http.RouteMatcher
import org.vertx.java.deploy.Verticle

public class RouteMatchExample extends Verticle {
	
  override start() {
  	val rm = new RouteMatcher => [
  		
	    get("/details/:user/:id") [
	        response.end('''User: «params.get("user")» ID: «params.get("id")»''');
	    ]
	
	    // Catch all - serve the index page
	    getWithRegEx(".*") [
	        response.sendFile("route_match/index.html")
	    ]
	]
    vertx.createHttpServer.requestHandler(rm).listen(8080);
  }
}