import 'package:flutter/material.dart';

import '../model/message.dart';

class MessageCard extends StatelessWidget {
  final Sender sender;
  final String content;

  const MessageCard({super.key, required this.sender, required this.content});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    if (sender == Sender.ai) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(5, 0, 5, 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              width: width * 0.10,
              height: width * 0.10,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.white70),
              child: const Icon(
                Icons.adb,
                color: Colors.black26,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
              constraints: BoxConstraints(
                  maxWidth: width * 0.5, minHeight: height * 0.05),
              decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: const BorderRadius.all(Radius.circular(10))
                      .copyWith(bottomLeft: const Radius.circular(0))),
              child: Text(
                content,
                style: const TextStyle(color: Colors.white70),
              ),
            )
          ],
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.fromLTRB(5, 0, 5, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
              constraints: BoxConstraints(
                  maxWidth: width * 0.5, minHeight: height * 0.05),
              decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: const BorderRadius.all(Radius.circular(10))
                      .copyWith(bottomRight: const Radius.circular(0))),
              child: Text(
                content,
                style: const TextStyle(color: Colors.white70),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Container(
              width: width * 0.10,
              height: width * 0.10,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.white70),
              child: const Icon(
                Icons.person,
                color: Colors.black26,
              ),
            )
          ],
        ),
      );
    }
  }
}
