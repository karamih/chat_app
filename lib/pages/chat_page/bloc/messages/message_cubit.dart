import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../model/message.dart';

part 'message_state.dart';

class MessageCubit extends Cubit<MessageState> {
  MessageCubit() : super(const MessageState(messages: []));

  void messageEvent(Message message){
    emit(state.addMessage(message: message));
  }
}
