const socket = require("socket.io-client")("https://localhost:3000");

socket.on("connect_error", (err) => {
  console.log(`connect_error due to ${err}`);
});

socket.on('connection', (socket) => {
  console.log('a user connected');
});

console.log('Es beggint');
