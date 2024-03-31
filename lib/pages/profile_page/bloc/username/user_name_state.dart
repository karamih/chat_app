part of 'user_name_cubit.dart';

class UserNameState {
  final String userName;

  const UserNameState({required this.userName});

  UserNameState copyWith({String? newUserName}) {
    return UserNameState(userName: newUserName ?? userName);
  }
}
