import 'package:chat_app/pages/chat_page/bloc/messages/message_cubit.dart';
import 'package:chat_app/pages/chat_page/bloc/send_mic_icon_change/sender_icon_cubit.dart';
import 'package:chat_app/pages/chat_page/model/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainSender extends StatelessWidget {
  const MainSender({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController textEditingController = TextEditingController();

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
      child: Row(
        children: [
          Flexible(
            child: Container(
              width: width,
              height: height * 0.07,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(35),
                border: Border.all(color: Colors.black26, width: 1.5),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Center(
                  child: TextField(
                    controller: textEditingController,
                    onChanged: (value) {
                      print(value);
                      BlocProvider.of<SenderIconCubit>(context)
                          .senderIconEvent(value);
                    },
                    style: const TextStyle(color: Colors.grey, fontSize: 18),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Message...',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            width: height * 0.07,
            height: height * 0.07,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.black26),
            child: Center(child: BlocBuilder<SenderIconCubit, SenderIconState>(
              builder: (context, state) {
                if (state.isEmpty) {
                  return IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.mic),
                    color: Colors.grey,
                  );
                } else {
                  return IconButton(
                      onPressed: () {
                        Message message = Message(
                            sender: Sender.user,
                            content: textEditingController.text);
                        textEditingController.clear();
                        BlocProvider.of<MessageCubit>(context)
                            .messageEvent(message);
                        BlocProvider.of<SenderIconCubit>(context)
                            .senderIconEvent(textEditingController.text);
                      },
                      icon: const Icon(
                        Icons.send,
                        color: Colors.grey,
                      ));
                }
              },
            )),
          )
        ],
      ),
    );
  }
}
