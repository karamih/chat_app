import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../bloc/avatar/avatar_cubit.dart';

class CustomBottomSheet {
  static void showAvatarSelection(BuildContext context, List<String> avatars) {
    final height = MediaQuery.of(context).size.height;

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.blueGrey[900],
      builder: (BuildContext context) {
        return Container(
          height: height * 0.3,
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 6.0,
              mainAxisSpacing: 6.0,
            ),
            itemCount: avatars.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  BlocProvider.of<AvatarCubit>(context)
                      .setAvatarEvent(avatars[index]);
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text(
                        'Your avatar updated.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      backgroundColor: Colors.green[300],
                      duration: const Duration(seconds: 2),
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  );
                },
                child: SvgPicture.asset(
                  avatars[index],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
