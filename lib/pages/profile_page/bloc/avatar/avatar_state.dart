part of 'avatar_cubit.dart';

class AvatarState {
  final String avatarPath;

  const AvatarState({required this.avatarPath});

  AvatarState copyWith({String? newAvatarPath}) {
    return AvatarState(avatarPath: newAvatarPath ?? avatarPath);
  }
}
