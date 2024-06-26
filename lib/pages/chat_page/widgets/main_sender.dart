import 'package:chatio/pages/chat_page/bloc/messages/message_cubit.dart';
import 'package:chatio/pages/chat_page/bloc/messages/message_status.dart';
import 'package:chatio/pages/chat_page/bloc/send_mic_icon_change/sender_icon_cubit.dart';
import 'package:chatio/pages/chat_page/bloc/speech_recognition/speech_recognition_cubit.dart';
import 'package:chatio/pages/chat_page/model/message.dart';
import 'package:chatio/pages/chat_page/repository/image_chat/upload_image.dart';
import 'package:chatio/pages/chat_page/widgets/upload_image.dart';
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
                padding: const EdgeInsets.fromLTRB(20, 0, 3, 0),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TextField(
                          controller: textEditingController,
                          onChanged: (value) {
                            BlocProvider.of<SenderIconCubit>(context)
                                .senderIconEvent(value);
                          },
                          onSubmitted: (value) {
                            Message message = Message(
                                sender: Sender.user,
                                content: MessageContentType(content: value),
                                isLoading: MessageStatusReady());
                            textEditingController.clear();
                            BlocProvider.of<MessageCubit>(context)
                                .messageEvent(message);
                            BlocProvider.of<SenderIconCubit>(context)
                                .senderIconEvent(value);
                          },
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 18),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Message...',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () async {
                            final uploadedImage =
                                await UploadImage().getImageFromGallery();
                            if (uploadedImage.isEmpty) return;
                            UploadImageScreen.showUploadImageDialog(
                                context, uploadedImage);
                          },
                          icon: Icon(
                            Icons.camera_alt,
                            color: Colors.grey.withOpacity(0.6),
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Container(
            width: height * 0.07,
            height: height * 0.07,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black26,
                border: Border.all(color: Colors.black26, width: 1.5)),
            child: Center(child: BlocBuilder<SenderIconCubit, SenderIconState>(
              builder: (context, senderIconState) {
                if (senderIconState.isEmpty) {
                  return BlocBuilder<SpeechRecognitionCubit,
                      SpeechRecognitionState>(
                    builder: (context, speechRecognitionState) {
                      return IconButton(
                        onPressed: () {
                          if (speechRecognitionState.status ==
                              SpeechRecognitionStatus.listening) {
                            context
                                .read<SpeechRecognitionCubit>()
                                .stopListeningEvent();
                          } else if (speechRecognitionState.status ==
                                  SpeechRecognitionStatus.stopped ||
                              speechRecognitionState.status ==
                                  SpeechRecognitionStatus.initial) {
                            context
                                .read<SpeechRecognitionCubit>()
                                .startListeningEvent();
                            if (speechRecognitionState.status ==
                                    SpeechRecognitionStatus.stopped ||
                                speechRecognitionState.status ==
                                    SpeechRecognitionStatus.error) {
                              Message message = Message(
                                  sender: Sender.user,
                                  content: MessageContentType(
                                      content: speechRecognitionState.words),
                                  isLoading: MessageStatusReady());
                              BlocProvider.of<MessageCubit>(context)
                                  .messageEvent(message);
                            }
                          }
                        },
                        icon: speechRecognitionState.status ==
                                SpeechRecognitionStatus.listening
                            ? const Icon(Icons.mic_off)
                            : const Icon(Icons.mic),
                        color: Colors.grey,
                      );
                    },
                  );
                } else {
                  return IconButton(
                      onPressed: () {
                        Message message = Message(
                            sender: Sender.user,
                            content: MessageContentType(
                                content: textEditingController.text),
                            isLoading: MessageStatusReady());
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
