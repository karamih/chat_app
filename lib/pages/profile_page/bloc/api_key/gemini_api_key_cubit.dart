import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'gemini_api_key_state.dart';

class GeminiApiKeyCubit extends Cubit<GeminiApiKeyState> {
  GeminiApiKeyCubit() : super(const GeminiApiKeyState(geminiApiKey: ''));

  void setGeminiApiKeyEvent(String key) {
    emit(state.copyWith(newGeminiApiKey: key));
    print(state.geminiApiKey);
    print(key);
  }
}
