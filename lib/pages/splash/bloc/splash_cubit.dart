
import 'package:bloc/bloc.dart';
import 'package:chat_app/pages/splash/repository/connection_repository.dart';
import 'package:meta/meta.dart';

part 'splash_state.dart';

part 'connection_state.dart';

class SplashCubit extends Cubit<SplashState> {
  ConnectionRepository connectionRepository = ConnectionRepository();

  SplashCubit() : super(SplashState(connect: ConnectionInitial()));

  void checkConnectionEvent() async {
    emit(state.copyWith(newConnection: ConnectionInitial()));
    bool connection = await connectionRepository.getConnectionState();
    if (connection) {
      emit(state.copyWith(newConnection: ConnectionOn()));
    } else {
      emit(state.copyWith(newConnection: ConnectionOff()));
    }
  }
}
