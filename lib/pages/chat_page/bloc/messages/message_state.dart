part of 'message_cubit.dart';

class MessageState {
  final List<Message?> messages;

   const MessageState({required this.messages});

  MessageState addMessage({required Message message}) {
    List<Message> updatedMessages = List.from(messages)..add(message);
    return MessageState(messages: updatedMessages);
  }

  // MessageState setLoading({required MessageStatus newMessageStatus}) {
  //   return MessageState(messages: messages, messageStatus: newMessageStatus);
  // }
}
