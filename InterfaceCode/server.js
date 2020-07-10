'use strict';
var http = require('http');
var port = process.env.PORT || 1337;
var md = require('./module');

http.createServer(function (req, res) {
    res.writeHead(200, { 'Content-Type': 'text/html' });
    res.write("The solution to a complicated math problem: " + md.call());
    res.end();
}).listen(port);
