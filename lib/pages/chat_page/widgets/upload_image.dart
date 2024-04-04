import 'dart:io';

import 'package:chatio/pages/chat_page/bloc/messages/message_cubit.dart';
import 'package:chatio/pages/chat_page/bloc/messages/message_status.dart';
import 'package:chatio/pages/chat_page/model/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UploadImageScreen {
  static void showUploadImageDialog(
      BuildContext context, String? uploadImagePath) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final TextEditingController textEditingController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.blueGrey[900],
          content: SizedBox(
            height: height * 0.30,
            width: width * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.file(File(uploadImagePath!))),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 8),
                  height: height * 0.06,
                  width: width * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey, width: 1.5),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: TextField(
                            controller: textEditingController,
                            onChanged: (value) {},
                            onSubmitted: (value) {
                              if (value.isNotEmpty) {
                                Navigator.pop(context);
                                context.read<MessageCubit>().messageEvent(
                                    Message(
                                        sender: Sender.user,
                                        content: MessageContentType(
                                            content: value,
                                            imagePath: uploadImagePath),
                                        isLoading: MessageStatusReady()));
                                textEditingController.clear();
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: const Text(
                                      'Caption is required.',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                    backgroundColor: Colors.red[300],
                                    duration: const Duration(seconds: 1),
                                    behavior: SnackBarBehavior.floating,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    action: SnackBarAction(
                                      label: 'Dismiss',
                                      onPressed: () {
                                        ScaffoldMessenger.of(context)
                                            .hideCurrentSnackBar();
                                      },
                                    ),
                                  ),
                                );
                              }
                            },
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 18),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Caption',
                              hintStyle: TextStyle(
                                  color: Colors.grey.withOpacity(0.4)),
                            ),
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              String caption = textEditingController.text;
                              if (caption.isNotEmpty) {
                                Navigator.pop(context);
                                context.read<MessageCubit>().messageEvent(
                                    Message(
                                        sender: Sender.user,
                                        content: MessageContentType(
                                            content: caption,
                                            imagePath: uploadImagePath),
                                        isLoading: MessageStatusReady()));
                                textEditingController.clear();
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: const Text(
                                      'Caption is required.',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                    backgroundColor: Colors.red[300],
                                    duration: const Duration(seconds: 1),
                                    behavior: SnackBarBehavior.floating,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    action: SnackBarAction(
                                      label: 'Dismiss',
                                      onPressed: () {
                                        ScaffoldMessenger.of(context)
                                            .hideCurrentSnackBar();
                                      },
                                    ),
                                  ),
                                );
                              }
                            },
                            icon: Icon(
                              Icons.send,
                              color: Colors.grey.withOpacity(0.6),
                            ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
