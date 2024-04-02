import 'package:chat_app/config/constants.dart';
import 'package:chat_app/config/storage/shared_prefrences.dart';
import 'package:chat_app/pages/profile_page/bloc/avatar/avatar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../bloc/api_key/gemini_api_key_cubit.dart';
import '../bloc/username/user_name_cubit.dart';

class CustomDialog {
  static void showUsernameInputDialog(BuildContext context) {
    final TextEditingController textEditingController = TextEditingController();

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.blueGrey[900],
          icon: Container(
            width: width * 0.10,
            height: width * 0.10,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: BlocBuilder<AvatarCubit, AvatarState>(
              builder: (context, state) {
                return SvgPicture.asset(state.avatarPath);
              },
            ),
          ),
          title: BlocBuilder<UserNameCubit, UserNameState>(
            builder: (context, state) {
              return RichText(
                  text: TextSpan(
                      style: const TextStyle(color: Colors.grey),
                      children: [
                    const TextSpan(text: 'You are '),
                    TextSpan(
                        text: state.userName,
                        style: TextStyle(
                            color: Colors.green[300],
                            fontWeight: FontWeight.bold))
                  ]));
            },
          ),
          content: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            height: height * 0.05,
            width: width * 0.4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey, width: 1.5),
            ),
            child: Center(
              child: TextField(
                controller: textEditingController,
                onSubmitted: (value) {
                  if (value.isNotEmpty) {
                    BlocProvider.of<UserNameCubit>(context)
                        .setUserNameEvent(textEditingController.text);
                    textEditingController.clear();
                    Navigator.pop(context, value);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text(
                          'Your username updated.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        backgroundColor: Colors.green[300],
                        duration: const Duration(seconds: 1),
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        action: SnackBarAction(
                          label: 'Dismiss',
                          onPressed: () {
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          },
                        ),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text(
                          'Please enter a username.',
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
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          },
                        ),
                      ),
                    );
                  }
                },
                style: const TextStyle(color: Colors.white54),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter your new username',
                  hintStyle: TextStyle(color: Colors.grey),
                  contentPadding: EdgeInsets.symmetric(horizontal: 5),
                ),
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Cancel',
                style: TextStyle(color: Colors.red[300]),
              ),
            ),
            TextButton(
              onPressed: () {
                String newUsername = textEditingController.text;
                if (newUsername.isNotEmpty) {
                  BlocProvider.of<UserNameCubit>(context)
                      .setUserNameEvent(newUsername);
                  textEditingController.clear();
                  Navigator.pop(context, newUsername);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text(
                        'Your username updated.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      backgroundColor: Colors.green[300],
                      duration: const Duration(seconds: 1),
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      action: SnackBarAction(
                        label: 'Dismiss',
                        onPressed: () {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        },
                      ),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text(
                        'Please enter a username.',
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
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        },
                      ),
                    ),
                  );
                }
              },
              child: Text(
                'Save',
                style: TextStyle(color: Colors.green[300]),
              ),
            ),
          ],
        );
      },
    );
  }

  static void showGeminiKeyDialog(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final TextEditingController textEditingController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.blueGrey[900],
          icon: Container(
            width: width * 0.10,
            height: width * 0.10,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: SvgPicture.asset(
              "assets/images/account-avatar-profile-user-8-svgrepo-com.svg",
            ),
          ),
          title: const Text(
            'Set your Gemini key',
            style: TextStyle(color: Colors.grey),
          ),
          content: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            height: height * 0.05,
            width: width * 0.4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey, width: 1.5),
            ),
            child: Center(
              child: TextField(
                controller: textEditingController,
                onSubmitted: (value) {
                  if (value.isNotEmpty) {
                    context
                        .read<GeminiApiKeyCubit>()
                        .setGeminiApiKeyEvent(value);
                    textEditingController.clear();
                    Navigator.pop(context, value);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text(
                          'Your key updated.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        backgroundColor: Colors.green[300],
                        duration: const Duration(seconds: 1),
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        action: SnackBarAction(
                          label: 'Dismiss',
                          onPressed: () {
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          },
                        ),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text(
                          'Please enter a key.',
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
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          },
                        ),
                      ),
                    );
                  }
                },
                style: const TextStyle(color: Colors.white54),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter your gemini key',
                  hintStyle: TextStyle(color: Colors.grey),
                  contentPadding: EdgeInsets.symmetric(horizontal: 5),
                ),
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Cancel',
                style: TextStyle(color: Colors.red[300]),
              ),
            ),
            TextButton(
              onPressed: () {
                String newKey = textEditingController.text;
                if (newKey.isNotEmpty) {
                  context
                      .read<GeminiApiKeyCubit>()
                      .setGeminiApiKeyEvent(newKey);
                  textEditingController.clear();
                  Navigator.pop(context, newKey);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text(
                        'Your key updated.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      backgroundColor: Colors.green[300],
                      duration: const Duration(seconds: 1),
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      action: SnackBarAction(
                        label: 'Dismiss',
                        onPressed: () {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        },
                      ),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text(
                        'Please enter a key.',
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
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        },
                      ),
                    ),
                  );
                }
              },
              child: Text(
                'Save',
                style: TextStyle(color: Colors.green[300]),
              ),
            ),
          ],
        );
      },
    );
  }

  static void showResetDataDialog(
      BuildContext context, SharedPrefrencesStorage storage) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.blueGrey[900],
          icon: Icon(
            Icons.warning,
            weight: 25,
            color: Colors.yellow,
          ),
          title: const Text(
            'Reset',
            style: TextStyle(color: Colors.grey),
          ),
          content: Container(
            padding: const EdgeInsets.all(10),
            height: height * 0.1,
            width: width * 0.4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey),
            ),
            child: const Center(
              child: Text(
                'You will reset your avatar, username and key!',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey),
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Cancel',
                style: TextStyle(color: Colors.green[300]),
              ),
            ),
            TextButton(
              onPressed: () {
                storage.clear();
                context.read<AvatarCubit>().setAvatarEvent(Constants.avatar);
                context
                    .read<UserNameCubit>()
                    .setUserNameEvent(Constants.userName);
                context
                    .read<GeminiApiKeyCubit>()
                    .setGeminiApiKeyEvent(Constants.key);
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text(
                      'App reset.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    backgroundColor: Colors.green[300],
                    duration: const Duration(milliseconds: 1500),
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    action: SnackBarAction(
                      label: 'Dismiss',
                      onPressed: () {
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      },
                    ),
                  ),
                );
              },
              child: Text(
                'Confirm',
                style: TextStyle(color: Colors.red[300]),
              ),
            ),
          ],
        );
      },
    );
  }
}
