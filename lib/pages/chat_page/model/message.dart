import 'package:flutter/material.dart';
import 'package:chat_app/pages/chat_page/bloc/messages/message_status.dart';

enum Sender {
  user,
  ai,
}

class MessageContentType{
  final String? content;
  final String? imagePath;
  const MessageContentType({this.content, this.imagePath});
}

class Message {
  final Sender sender;
  final MessageContentType content;
  final MessageStatus isLoading;


  const Message({required this.sender, required this.content, required this.isLoading});
}
