enum Sender {
  user,
  ai,
}

class Message {
  final Sender sender;
  final String? content;

  // final DateTime timeStamp;

  const Message({required this.sender, required this.content});
}
