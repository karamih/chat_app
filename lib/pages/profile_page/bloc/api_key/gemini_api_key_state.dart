part of 'gemini_api_key_cubit.dart';

class GeminiApiKeyState {
  final String geminiApiKey;

  const GeminiApiKeyState({required this.geminiApiKey});

  GeminiApiKeyState copyWith({String? newGeminiApiKey}) {
    return GeminiApiKeyState(geminiApiKey: newGeminiApiKey ?? geminiApiKey);
  }
}
