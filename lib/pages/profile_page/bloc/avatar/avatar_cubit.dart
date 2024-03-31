import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'avatar_state.dart';

class AvatarCubit extends Cubit<AvatarState> {
  AvatarCubit()
      : super(const AvatarState(
            avatarPath:
                'assets/images/account-avatar-profile-user-8-svgrepo-com.svg'));

  void setAvatarEvent(String avatarPath) {
    emit(state.copyWith(newAvatarPath: avatarPath));
  }
}
