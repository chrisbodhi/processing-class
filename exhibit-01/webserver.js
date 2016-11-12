var http = require('http');
var fs = require('fs');
var url = require('url');

var server = http.createServer(function (request, response) {
  // Break up the url into easier-to-use parts
  var urlParts = url.parse(request.url, true);

  // Create a regular expression to match requests to toggle LEDs
  var snakeRegex = /snake/;

  if (urlParts.pathname.match(snakeRegex)) {
    // If there is a request containing the string 'snake' call a function, serveSnake
    serveSnake(urlParts.pathname, request, response);
  } else {
    // All other request will call a function, showIndex
    showIndex(urlParts.pathname, request, response);
  }
});

server.listen(8080);

 console.log('Server running at http://rascal.local:8080/');

// Respond to the request with our index.html page
function showIndex (url, request, response) {
  // Create a response header telling the browser to expect html
  response.writeHead(200, {"Content-Type": "text/html"});

  // Use fs to read in index.html
  fs.readFile(__dirname + '/index.html', function (err, content) {
    // If there was an error, throw to stop code execution
    if (err) {
      throw err;
    }

    // Serve the content of index.html read in by fs.readFile
    response.end(content);
  });
}

// Respond to the request with our snake.js file
function serveSnake(url, request, response) {
  // Create a response header telling the browser to expect js
  response.writeHead(200, {"Content-Type": "application/javascript"});

  // Use fs to read in index.html
  fs.readFile(__dirname + '/snake.js', function (err, content) {
    // If there was an error, throw to stop code execution
    if (err) {
      throw err;
    }

    // Serve the content of index.html read in by fs.readFile
    response.end(content);
  });
}

