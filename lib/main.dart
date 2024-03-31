import 'package:chat_app/pages/chat_page/bloc/messages/message_cubit.dart';
import 'package:chat_app/pages/chat_page/bloc/send_mic_icon_change/sender_icon_cubit.dart';
import 'package:chat_app/pages/chat_page/chat_page.dart';
import 'package:chat_app/pages/home_page/home_page.dart';
import 'package:chat_app/pages/profile_page/bloc/api_key/gemini_api_key_cubit.dart';
import 'package:chat_app/pages/profile_page/bloc/avatar/avatar_cubit.dart';
import 'package:chat_app/pages/profile_page/bloc/username/user_name_cubit.dart';
import 'package:chat_app/pages/profile_page/profile_page.dart';
import 'package:chat_app/pages/splash/bloc/splash_cubit.dart';
import 'package:chat_app/pages/splash/splash_scrren.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

import 'config/secrets.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
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
      create: (context) => AvatarCubit(),
    ),
    BlocProvider(
      create: (context) => UserNameCubit(),
    ),
    BlocProvider(
      create: (context) => GeminiApiKeyCubit(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chattito',
      initialRoute: '/',
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        HomePage.routeName: (context) => const HomePage(),
        ChatPage.routeName: (context) => const ChatPage(),
        ProfilePage.routeName: (context) => const ProfilePage()
      },
      home: const SplashScreen(),
    );
  }
}
