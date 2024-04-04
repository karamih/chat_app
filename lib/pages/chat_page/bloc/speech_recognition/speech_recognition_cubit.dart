import 'package:bloc/bloc.dart';
import 'package:speech_to_text/speech_to_text.dart';

part 'speech_recognition_state.dart';

class SpeechRecognitionCubit extends Cubit<SpeechRecognitionState> {
  final SpeechToText _speechToText = SpeechToText();

  SpeechRecognitionCubit()
      : super(const SpeechRecognitionState(
            status: SpeechRecognitionStatus.initial));

  void startListeningEvent() async {
    if (await _speechToText.initialize()) {
      _speechToText.listen(
          onResult: (result) {
            emit(state.copyWith(
              newStatus: SpeechRecognitionStatus.listening,
              newWords: result.recognizedWords,
            ));
            print(result);
            print(result.recognizedWords);
            if (result.finalResult == true) {
              emit(state.copyWith(newStatus: SpeechRecognitionStatus.stopped));
            }
          },
          pauseFor: const Duration(seconds: 10),
          listenFor: const Duration(seconds: 20));
    } else {
      emit(state.copyWith(
        newStatus: SpeechRecognitionStatus.error,
        newWords: 'Speech recognition initialization failed.',
      ));
    }
  }

  void stopListeningEvent() {
    // Stop speech recognition
    _speechToText.stop();
    emit(state.copyWith(newStatus: SpeechRecognitionStatus.stopped));
  }
}
