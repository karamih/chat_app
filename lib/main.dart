import 'package:chatio/pages/chat_page/bloc/messages/message_cubit.dart';
import 'package:chatio/pages/chat_page/bloc/send_mic_icon_change/sender_icon_cubit.dart';
import 'package:chatio/pages/chat_page/bloc/speech_recognition/speech_recognition_cubit.dart';
import 'package:chatio/pages/chat_page/chat_page.dart';
import 'package:chatio/pages/home_page/home_page.dart';
import 'package:chatio/pages/profile_page/bloc/api_key/gemini_api_key_cubit.dart';
import 'package:chatio/pages/profile_page/bloc/avatar/avatar_cubit.dart';
import 'package:chatio/pages/profile_page/bloc/username/user_name_cubit.dart';
import 'package:chatio/pages/profile_page/profile_page.dart';
import 'package:chatio/pages/splash/bloc/splash_cubit.dart';
import 'package:chatio/pages/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/storage/shared_prefrences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPrefrencesStorage storage = SharedPrefrencesStorage();
  await storage.initStorage();

  runApp(MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SplashCubit(),
        ),
        BlocProvider(
          create: (context) => SenderIconCubit(),
        ),
        BlocProvider(
          create: (context) => MessageCubit(),
        ),
        BlocProvider(
          create: (context) => AvatarCubit(storage),
        ),
        BlocProvider(
          create: (context) => UserNameCubit(storage),
        ),
        BlocProvider(
          create: (context) => GeminiApiKeyCubit(storage),
        ),
        BlocProvider(
          create: (context) => SpeechRecognitionCubit(),
        )
      ],
      child: MyApp(
        storage: storage,
      )));
}

class MyApp extends StatelessWidget {
  final SharedPrefrencesStorage storage;

  const MyApp({super.key, required this.storage});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chatio',
      initialRoute: '/',
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        HomePage.routeName: (context) => HomePage(
              storage: storage,
            ),
        ChatPage.routeName: (context) => ChatPage(
              storage: storage,
            ),
        ProfilePage.routeName: (context) => ProfilePage(
              storage: storage,
            )
      },
      home: const SplashScreen(),
    );
  }
}
