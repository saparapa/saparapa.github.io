// Simpel webserver, så I lokalt kan køre processing i en browser
var connect = require('connect');
var serveStatic = require('serve-static');
connect().use(serveStatic(__dirname)).listen(8080);
console.log("Du har nu en lokal webserver kørende, skriv http://localhost:8080/index.html i din browser");
