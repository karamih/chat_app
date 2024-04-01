import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../../config/storage/shared_prefrences.dart';

part 'user_name_state.dart';

class UserNameCubit extends Cubit<UserNameState> {
  SharedPrefrencesStorage storage;

  UserNameCubit(this.storage) : super(UserNameState(userName: storage.getUsername()));

  void setUserNameEvent(String userName) {
    emit(state.copyWith(newUserName: userName));
    storage.setUsername(userName);
  }
}
