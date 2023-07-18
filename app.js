var http = require('http');
var fs = require('fs');
var port = 8081

http.createServer(function (req, res) {
	res.writeHead(200, { 'Content-Type': 'text/html' });

	// req.url stores the path in the url
	var url = req.url;
	if (url === "/") {

		fs.readFile("homepage.html", function (err, pgres) {
			if (err)
				res.write("homepage.HTML NOT FOUND");
			else {
				res.writeHead(200, { 'Content-Type': 'text/html' });
				res.write(pgres);
				res.end();
			}
		});
	}
	else if (url === "/primechecker") {
		fs.readFile("prime.html", function (err, pgres) {
			if (err)
				res.write("prime.HTML NOT FOUND");
			else {
				res.writeHead(200, { 'Content-Type': 'text/html' });
				res.write(pgres);
				res.end();
			}
		});
	}
	
}).listen(port, function () {
	console.log(`SERVER STARTED AT PORT: ${port}`);
});