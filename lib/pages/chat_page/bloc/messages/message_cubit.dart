import 'package:bloc/bloc.dart';
import 'package:chat_app/pages/chat_page/bloc/messages/message_status.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:meta/meta.dart';

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
            content: '',
            isLoading: MessageStatusLoading())));
    gemini.text(message.content!).then((value) {
      emit(state.addMessage(
          message: Message(
              sender: Sender.ai,
              content: value?.output ?? 'try again later',
              isLoading: MessageStatusReady())));
    }).catchError((e) {
      emit(state.addMessage(
          message: Message(
              sender: Sender.ai,
              content: 'check your connection!',
              isLoading: MessageStatusReady())));
      print(e);
    });
  }
}
