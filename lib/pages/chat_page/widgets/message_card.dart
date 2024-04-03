import 'dart:io';

import 'package:chat_app/pages/profile_page/bloc/avatar/avatar_cubit.dart';
import 'package:chat_app/pages/profile_page/bloc/username/user_name_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../model/message.dart';

class MessageCard extends StatelessWidget {
  final Sender sender;
  final MessageContentType content;

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
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: SvgPicture.asset(
                    'assets/images/account-avatar-profile-user-13-svgrepo-com.svg')),
            const SizedBox(
              width: 8,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
              constraints: BoxConstraints(
                  minWidth: width * 0.2,
                  maxWidth: width * 0.6,
                  minHeight: height * 0.05),
              decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: const BorderRadius.all(Radius.circular(10))
                      .copyWith(bottomLeft: const Radius.circular(0))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "2Byte",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.teal[600]),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    content.content!,
                    style: const TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    } else {
      if (content.imagePath != null) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(5, 0, 5, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
                constraints: BoxConstraints(
                    minWidth: width * 0.2,
                    maxWidth: width * 0.6,
                    minHeight: height * 0.05),
                decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: const BorderRadius.all(Radius.circular(10))
                        .copyWith(bottomRight: const Radius.circular(0))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    BlocBuilder<UserNameCubit, UserNameState>(
                      builder: (context, state) {
                        return Text(
                          state.userName,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.teal[600]),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.file(File(content.imagePath!))),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      content.content!,
                      style: const TextStyle(color: Colors.white70),
                    ),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Container(
                  width: width * 0.10,
                  height: width * 0.10,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: BlocBuilder<AvatarCubit, AvatarState>(
                    builder: (context, state) {
                      return SvgPicture.asset(state.avatarPath);
                    },
                  ))
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
                    minWidth: width * 0.2,
                    maxWidth: width * 0.6,
                    minHeight: height * 0.05),
                decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: const BorderRadius.all(Radius.circular(10))
                        .copyWith(bottomRight: const Radius.circular(0))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    BlocBuilder<UserNameCubit, UserNameState>(
                      builder: (context, state) {
                        return Text(
                          state.userName,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.teal[600]),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      content.content!,
                      style: const TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Container(
                  width: width * 0.10,
                  height: width * 0.10,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: BlocBuilder<AvatarCubit, AvatarState>(
                    builder: (context, state) {
                      return SvgPicture.asset(state.avatarPath);
                    },
                  ))
            ],
          ),
        );
      }
    }
  }
}
