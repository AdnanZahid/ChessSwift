const express = require('express');
const app = express();
var http = require('http').createServer(app)
var io = require('socket.io')(http);
const port = process.env.PORT || 80;

app.use(express.static(__dirname + '/public'));

io.on('connection', function onConnection(socket){

    console.log("Outside update");

  setTimeout(function() {

    console.log("Inside update");

    socket.broadcast.emit('drawing', data);
  }, 2000);

  socket.on('drawing', (data) => socket.broadcast.emit('drawing', data));
});

io.on('drawing', function onConnection(socket){

    console.log("Outside update");

  setTimeout(function() {

    console.log("Inside update");

    socket.broadcast.emit('drawing', data);
  }, 2000);

  socket.on('drawing', (data) => socket.broadcast.emit('drawing', data));
});

http.listen(port, () => console.log('listening on port ' + port));
