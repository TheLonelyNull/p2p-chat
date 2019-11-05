import 'dart:io';

Socket socket;

void main() {
  Socket.connect("0.0.0.0", 44444).then((Socket sock) {
    socket = sock;
    socket.listen(dataHandler,
        onError: errorHandler, onDone: doneHandler, cancelOnError: false);
  }).catchError((Error e) {
    print("Unable to connect: $e");
  });
  //Connect standard in to the socket
  stdin.listen(
      (data) => socket.write(new String.fromCharCodes(data).trim() + '\n'));
}

void dataHandler(data) {
  print(new String.fromCharCodes(data).trim());
}

void errorHandler(error, StackTrace trace) {
  print(error);
}

void doneHandler() {
  socket.destroy();
}
