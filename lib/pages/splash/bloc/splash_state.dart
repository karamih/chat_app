part of 'splash_cubit.dart';

class SplashState {
  final ConnectionState connect;

  const SplashState({required this.connect});

  SplashState copyWith({ConnectionState? newConnection}) {
    return SplashState(connect: newConnection ?? connect);
  }
}
