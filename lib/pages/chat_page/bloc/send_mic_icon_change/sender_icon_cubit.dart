import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sender_icon_state.dart';

class SenderIconCubit extends Cubit<SenderIconState> {
  SenderIconCubit() : super(const SenderIconState(isEmpty: true));

  void senderIconEvent(String value){
    if(value.isEmpty){
      emit(state.copyWith(newState: true));
    }else{
      emit(state.copyWith(newState: false));
    }
  }
}
