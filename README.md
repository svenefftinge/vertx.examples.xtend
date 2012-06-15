# vert.x Xtend Examples 

> "The text as well as the examples are derived from the Vert.x Java Examples written by Tim Fox, see https://github.com/purplefox/vert.x/tree/master/src/examples/java)
I have modified the text a bit to match the changes in the project. Mostly I just changed how a vert.x application is started, because the project contains Eclipse launch configurations which allow to run and/or debug the examples from within Eclipse." 

## Prerequisites:

* This is an Eclipse project, so you need to import it into an Eclipse IDE with the latest version of Xtend installed. 
Download from here http://xtend-lang.org 
* JDK/JRE 1.7.0+ must be installed and the JDK/JRE bin directory must be on your PATH

There now follows a description of all the available examples:

## Echo Server + Client

A simple echo server which echos back any sent to it

To run the server:
_Select "launch_configs/EchoServer.launch" and choose run/debug_

Then telnet localhost 1234 and notice how text entered via telnet is echoed back

Instead of telnet you can also run a simple echo client in a different console:

_Select "launch_configs/EchoClient.launch" and choose run/debug_

## Fanout Server

Fans out all data received on any one connection to all other connections.

To run the server:

_Select "launch_configs/FanoutServer.launch" and choose run/debug_

Then telnet localhost 1234 from different consoles. Note how data entered in telnet is echoed to all connected connections

## HTTP

A simple HTTP server which just returns some hard-coded HTML to the client, and a simple HTTP client which sends a GET
request and displays the response it receives.

To run the server:

_Select "launch_configs/HTTPServer.launch" and choose run/debug_

Then point your browser at [http://localhost:8080][http;//localhost:8080]
Alternatively, you can also run the HTTP client in a different console:

_Select "launch_configs/HTTPClient.launch" and choose run/debug_

## HTTPS

Like the HTTP example, but using HTTPS

To run the server:

_Select "launch_configs/HTTPSServer.launch" and choose run/debug_

Then point your browser at [https://localhost:4443][https://localhost:4443]

Alternatively, you can also run the HTTPS client in a different console:

_Select "launch_configs/HTTPSClient.launch" and choose run/debug_

You'll get a warning from your browser since the server certificate the server is using is not known to it, that's normal.

## Proxy

A very simple HTTP proxy which simply proxies requests/response from a client to a server and back again.

It includes

a) A simple http server which just takes the request and sends back a response in 10 chunks

b) A simple http client which sends an http request with 10 chunks (via the proxy server), and displays any
response it receives

c) A proxy server which simply sits in the middle proxying requests and responses between client and server

Do each part in a different console:

To run the http server:

Select "launch_configs/ProxyHTTPServer.launch" and choose run/debug_

Run the proxy server:

Select "launch_configs/ProxyServer.launch" and choose run/debug_

Run the http client:

Select "launch_configs/ProxyHTTPClient.launch" and choose run/debug_

## PubSub

A very simple publish-subscribe server.

Connections can subscribe to topics and unsubscribe from topics. Topics can be any arbitrary string.

When subscribed, connections will receive any messages published to any of the topics it is subscribed to.

The pub-sub server understands the following simple text protocol. Each line is terminated by CR (hit enter on telnet)

To subscribe to a topic:

`subscribe,<topic_name>`

To unsubscribe from a topic:

`unsubscribe,<topic_name>`

To publish a message to a topic:

`publish,<topic_name>,<message>`

Where:

`<topic_name>` is the name of a topic

`<message>` is some string you want to publish

To run the server:

_Select "launch_configs/PubSubServer.launch" and choose run/debug_

Then open some more consoles and telnet localhost 1234, and experiment with the protocol.

## SendFile

Simple web server that uses sendfile to serve content directly from disk to the socket bypassing user space. This is a very efficient way of serving static files from disk.

The example contains three static pages: index.html, page1.html and page2.html which are all served using sendfile.

To run the server:

_Select "launch_configs/SendFileExample.launch" and choose run/debug_

Then point your browser at http://localhost:8080 and click around

## SSL

This is like the echo example, but this time using SSL.

To run the server:

_Select "launch_configs/SSLServer.launch" and choose run/debug_

To run the client in a different console:

_Select "launch_configs/SSLClient.launch" and choose run/debug_

## Websockets

A simple example demonstrating HTML 5 websockets. The example serves a simple page which has some JavaScript in it
to create a websocket to a server and send and receive data from it.

The server just echoes back any data is receives on the websocket.

To run the server:

_Select "launch_configs/WebSocketsExample.launch" and choose run/debug_

Then point your browser at: http://localhost:8080

## Route Match

This example shows how a route matcher can be used with a vert.x HTTP server to allow REST-style resource based matching of URIS
in the manner of express (JS) or Sinatra.

To run the example:

_Select "launch_configs/RouteMatchExample.launch" and choose run/debug_

Then point your browser at: http://localhost:8080.

An index page will be served which contains some links to urls of the form:

`/details/<user>/<id>`

The server will extract the user and id from the uri and display it on the returned page

## SockJS

A simple example demonstrating SockJS connections from a browser. The example serves a simple page which has some JavaScript in it
to create a SockJS connection to a server and send and receive data from it.

It installs a simple SockJS application which simply echoes back any data received.

To run the server:

_Select "launch_configs/SockJsExample.launch" and choose run/debug_

Then point your browser at: http://localhost:8080

## Eventbus Bridge

This example shows how the vert.x event bus can extend to client side JavaScript.

To run the server:

_Select "EventBusBridge.launch" and choose run/debug_

The example shows a simple publish / subscribe client side JavaScript application that uses the vert.x event bus.

Using the application you can subscribe to one or more "addresses", then send messages to those addresses.

To run it, open one or more browsers and point them to http://localhost:8080.

First click to connect then try subscribing and sending messages and see how the separate browsers can interoperate on the event bus.










