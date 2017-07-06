What are some common HTTP status codes?
  - 404 Not Found: requested resource is no longer available.
  - 403 Forbidden: access to the resource is forbidden.
  - 500 Internal Server Error: catchall server-side error code.
  - 503 Service Unavailable: the web server isn't available.
  - 504 Gateway Timeout: indicates a gateway timeout. Possible DNS issue, a network device is down or other machine is busy.

What is the difference between a GET request and a POST request? When might each be used?
  - The difference between the GET and POST methods are that the GET method retrieves information from a server while the POST method sends information to the server. The GET method is commonly used to retrieve a web page using a path or URI (Uniform Resource Identifier). The POST method is used when a user fills out a HTML form or uploads a file.

Optional bonus question: What is a cookie (the technical kind, not the delicious kind)? How does it relate to HTTP requests?
  - A cookie is a small piece of data that the server sends to the user web browser. The browser will store it and send it back when the user makes another HTTP request to the same server. The main uses for cookies are session management, which can be temporary or permanent, personalization and tracking. After a server receives an HTTP request, the server sends a cookie that is set by the browser for the user. When the user makes another request to the same server, the stored cookie is sent along with it.