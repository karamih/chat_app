part of 'sender_icon_cubit.dart';

class SenderIconState {
  final bool isEmpty;

  const SenderIconState({required this.isEmpty});

  SenderIconState copyWith({bool? newState}) {
    return SenderIconState(isEmpty: newState ?? isEmpty);
  }
}
