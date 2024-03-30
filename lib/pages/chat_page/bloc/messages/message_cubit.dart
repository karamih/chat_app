import 'package:bloc/bloc.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:meta/meta.dart';

import '../../model/message.dart';

part 'message_state.dart';

class MessageCubit extends Cubit<MessageState> {
  final gemini = Gemini.instance;

  MessageCubit() : super(const MessageState(messages: []));

  void messageEvent(Message message) {
    emit(state.addMessage(message: message));
    gemini.text(message.content!).then((value) {
      emit(state.addMessage(
          message: Message(
              sender: Sender.ai, content: value?.output ?? 'try again later')));
    }).catchError((e) => print(e));
  }
}
