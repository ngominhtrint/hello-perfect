import PerfectLib
import PerfectHTTP
import PerfectHTTPServer

// Create HTTP server.
let server = HTTPServer()

// Create the container variable for routes to be added to.
var routes = Routes()

// Register your own routes and handlers
// This is an example "Hello, world!" HTML route
routes.add(method: .get, uri: "/", handler: {
    request, response in
    // Setting the response content type explicitly to text/html
    response.setHeader(.contentType, value: "text/html")
    // Adding some HTML to the response body object
    response.appendBody(string: "<html><title>Hello, world!</title><body>Hello, Perfect!</body></html>")
    // Signalling that the request is completed
    response.completed()
})


// Adding a route to handle the GET people list URL
routes.add(method: .get, uri: "/api/v1/people", handler: {
    request, response in
    
    let people = People()
    
    // Setting the response content type explicitly to application/json
    response.setHeader(.contentType, value: "application/json")
    // Setting the body response to the JSON list generated
    response.appendBody(string: people.list())
    // Signalling that the request is completed
    response.completed()
})

// Adding the route to handle the POST people add URL, with post body params
routes.add(method: .post, uri: "/api/v1/people") { request, response in
    let people = People()
    
    // Setting the response content type explicitly to application/json
    response.setHeader(.contentType, value: "application/json")
    // Adding a new person, passing the complete HTTPRequest object to the function
    response.appendBody(string: people.add(request))
    // Signalling that the request is completed
    response.completed()
}

routes.add(method: .post, uri: "/api/v1/people/json") { request, response in
    let people = People()
    
    // Setting the response content type explicitly to application/json
    response.setHeader(.contentType, value: "application/json")
    // Adding a new person, passing the just the request's post body as a raw string to the function
    response.appendBody(string: people.add(request.postBodyString!))
    // Signalling that the request is completed
    response.completed()
}

// Add the routes to the server
server.addRoutes(routes)

// Set a listen port of 8181
server.serverPort = 8181

do {
    // Launch the HTTP server.
    try server.start()
} catch {
    fatalError("\(error)") // fatal error launching one of the servers
}
