import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../config/storage/shared_prefrences.dart';

part 'avatar_state.dart';

class AvatarCubit extends Cubit<AvatarState> {
  SharedPrefrencesStorage storage;

  AvatarCubit(this.storage)
      : super(AvatarState(
      avatarPath: storage.getAvatar()));

  void setAvatarEvent(String avatarPath) {
    emit(state.copyWith(newAvatarPath: avatarPath));
    storage.setAvatar(avatarPath);
  }
}
