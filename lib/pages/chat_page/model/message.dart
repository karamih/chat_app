import 'package:chat_app/pages/chat_page/bloc/messages/message_status.dart';

enum Sender {
  user,
  ai,
}

class Message {
  final Sender sender;
  final String? content;
  final MessageStatus isLoading;

  // final DateTime timeStamp;

  const Message({required this.sender, required this.content, required this.isLoading});
}
