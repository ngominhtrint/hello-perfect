import PerfectHTTP
import PerfectHTTPServer

// Register your own routes and handlers
var routes = Routes()
routes.add(method: .get, uri: "/") {
    request, response in
    response.setHeader(.contentType, value: "text/html")
    response.appendBody(string: "<html><title>Hello</title><body>Hello, Perfect framework!</body></html>")
        .completed()
}

do {
    // Launch the HTTP server.
    try HTTPServer.launch(
        .server(name: "www.example.ca", port: 8181, routes: routes))
} catch {
    fatalError("\(error)") // fatal error launching one of the servers
}
