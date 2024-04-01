import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../config/storage/shared_prefrences.dart';

part 'gemini_api_key_state.dart';

class GeminiApiKeyCubit extends Cubit<GeminiApiKeyState> {
  SharedPrefrencesStorage storage;

  GeminiApiKeyCubit(this.storage)
      : super(GeminiApiKeyState(geminiApiKey: storage.getKey()));

  void setGeminiApiKeyEvent(String key) {
    emit(state.copyWith(newGeminiApiKey: key));
    if (key.isNotEmpty) {
      storage.setKey(key);
    }
  }
}
