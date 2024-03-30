import 'package:chat_app/pages/chat_page/bloc/messages/message_cubit.dart';
import 'package:chat_app/pages/chat_page/widgets/main_sender.dart';
import 'package:chat_app/pages/chat_page/widgets/message_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatPage extends StatelessWidget {
  static String routeName = '/chat_page';

  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
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
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
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
              Expanded(child: BlocBuilder<MessageCubit, MessageState>(
                builder: (context, state) {
                  return ListView.builder(
                      itemBuilder: (context, index) => MessageCard(
                          sender: state.messages[index]!.sender,
                          content: state.messages[index]?.content),
                      itemCount: state.messages.length);
                },
              )),
              const Divider(
                color: Colors.black26,
                thickness: 2,
              ),
              const MainSender()
            ],
          ),
        ));
  }
}
