import 'package:chat_app/config/storage/shared_prefrences.dart';
import 'package:chat_app/pages/chat_page/bloc/messages/message_cubit.dart';
import 'package:chat_app/pages/chat_page/bloc/messages/message_status.dart';
import 'package:chat_app/pages/chat_page/widgets/main_sender.dart';
import 'package:chat_app/pages/chat_page/widgets/message_card.dart';
import 'package:chat_app/pages/home_page/home_page.dart';
import 'package:chat_app/pages/profile_page/bloc/api_key/gemini_api_key_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'model/message.dart';

class ChatPage extends StatelessWidget {
  final SharedPrefrencesStorage storage;
  static String routeName = '/chat_page';

  const ChatPage({super.key, required this.storage});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return BlocBuilder<GeminiApiKeyCubit, GeminiApiKeyState>(
      builder: (context, state) {
        Gemini.init(apiKey: storage.getKey());
        return Scaffold(
            appBar: AppBar(
              title: const Text(
                "Chat",
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    letterSpacing: 2),
              ),
              centerTitle: true,
              iconTheme: const IconThemeData(color: Colors.grey),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: const BorderSide(color: Colors.black54)),
              backgroundColor: Colors.black26,
              elevation: 1,
              bottom: const PreferredSize(
                  preferredSize: Size(0, 20), child: SizedBox()),
              toolbarHeight: 60,
            ),
            backgroundColor: Colors.blueGrey[900],
            body: Container(
              padding: const EdgeInsets.only(top: 15),
              width: width,
              height: height,
              child: Column(
                children: [
                  Expanded(
                    child: BlocBuilder<MessageCubit, MessageState>(
                      builder: (context, state) {
                        final lastMessage = state.messages.lastOrNull;
                        if (lastMessage != null &&
                            lastMessage.sender == Sender.ai &&
                            lastMessage.isLoading is MessageStatusLoading) {
                          return Center(
                            child: LoadingAnimationWidget.staggeredDotsWave(
                                color: Colors.grey, size: 35),
                          );
                        } else {
                          return ListView.builder(
                            itemBuilder: (context, index) {
                              final message = state.messages[index];
                              if (message?.content != null &&
                                  message!.content!.isNotEmpty) {
                                return MessageCard(
                                  sender: message.sender,
                                  content: message.content,
                                );
                              } else {
                                return Container();
                              }
                            },
                            itemCount: state.messages.length,
                          );
                        }
                      },
                    ),
                  ),
                  const Divider(
                    color: Colors.black26,
                    thickness: 2,
                  ),
                  const MainSender()
                ],
              ),
            ));
      },
    );
  }
}
