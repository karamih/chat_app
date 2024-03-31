import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'user_name_state.dart';

class UserNameCubit extends Cubit<UserNameState> {
  UserNameCubit() : super(const UserNameState(userName: 'User'));

  void setUserNameEvent(String userName) {
    emit(state.copyWith(newUserName: userName));
  }
}
