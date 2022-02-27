| Request Methods | Description                                                                                                                                                 |
| --------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------- |
| GET             | Requests data from a specified resource (i.e. web server)                                                                                                   |
| HEAD            | Similar to GET request, but without the response body.                                                                                                      |
|                 | This is useful for retrieving meta-information written in response headers, without having to transport the entire content                                  |
| POST            | Requests that the server accept some data from the client                                                                                                   |
|                 | The data POSTed might be some data that is the result of submitting a web form                                                                              |
| PUT             | Similar to POST, but if the URI refers to an already exising resource, it is modified                                                                       |
|                 | If the URI does not point to an existing resource, then the server can create the resouce with that URI                                                     |
| DELETE          | Deletes the specified resource                                                                                                                              |
| TRACE           | Echoes back the received request so that a client can see what changes or additions have been made by intermediate servers                                  |
| OPTIONS         | Returns the HTTP methods that the server supports for specified URL                                                                                         |
| CONNECT         | Converts the request connection to a transparent TCP/IP tunnerl, usually to facilitate SSL-encypted communication (HTTPS) through an unencrypted HTTP proxy |
| PATCH           | Is used to apply partial modifications to a resource                                                                                                        |