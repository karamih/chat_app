import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:chat_app/pages/chat_page/bloc/messages/message_status.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

import '../../model/message.dart';

part 'message_state.dart';

class MessageCubit extends Cubit<MessageState> {
  final gemini = Gemini.instance;

  MessageCubit() : super(const MessageState(messages: []));

  void messageEvent(Message message) {
    emit(state.addMessage(message: message));
    emit(state.addMessage(
        message: Message(
            sender: Sender.ai,
            content: const MessageContentType(),
            isLoading: MessageStatusLoading())));
    if (message.content.imagePath == null) {
      gemini.text(message.content.content!).then((value) {
        emit(state.addMessage(
            message: Message(
                sender: Sender.ai,
                content: MessageContentType(
                    content: value?.output ?? 'try again later'),
                isLoading: MessageStatusReady())));
      }).catchError((e) {
        emit(state.addMessage(
            message: Message(
                sender: Sender.ai,
                content:
                    const MessageContentType(content: 'check your connection!'),
                isLoading: MessageStatusReady())));
      });
    }
    if (message.content.imagePath != null) {
      final file = File(message.content.imagePath!);
      gemini
          .textAndImage(
              text: message.content.content!, images: [file.readAsBytesSync()])
          .then((value) => emit(state.addMessage(
              message: Message(
                  sender: Sender.ai,
                  content: MessageContentType(
                      content: value?.output ?? 'try again later'),
                  isLoading: MessageStatusReady()))))
          .catchError((e) => emit(state.addMessage(
              message: Message(
                  sender: Sender.ai,
                  content: const MessageContentType(
                      content: 'check your connection!'),
                  isLoading: MessageStatusReady()))));
    }
  }

  void deleteChatEvent(){
    state.messages.clear();
    emit(const MessageState(messages: []));
  }
}
