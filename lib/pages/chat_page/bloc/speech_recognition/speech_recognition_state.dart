part of 'speech_recognition_cubit.dart';

enum SpeechRecognitionStatus { initial, listening, stopped, error }

class SpeechRecognitionState {
  final SpeechRecognitionStatus? status;
  final String? words;

  const SpeechRecognitionState({required this.status, this.words});

  SpeechRecognitionState copyWith(
      {required SpeechRecognitionStatus? newStatus, String? newWords}) {
    return SpeechRecognitionState(
        status: newStatus ?? status, words: newWords ?? words);
  }
}
