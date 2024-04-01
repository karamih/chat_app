import 'package:chat_app/pages/profile_page/bloc/avatar/avatar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainProfileCard extends StatelessWidget {
  final String title;
  final String? pathIcon;
  final VoidCallback? onPressed;

  const MainProfileCard({
    Key? key,
    required this.title,
    this.pathIcon,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
        width: width * 0.75,
        height: width * 0.3,
        decoration: BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.black54),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.w500,
                fontSize: 18,
                letterSpacing: 2.5,
              ),
            ),
            Expanded(child: BlocBuilder<AvatarCubit, AvatarState>(
              builder: (context, state) {
                if (title == 'Avatar') {
                  return SvgPicture.asset(
                    state.avatarPath,
                    width: width * 0.14,
                  );
                } else {
                  return SvgPicture.asset(
                    pathIcon!,
                    width: width * 0.14,
                  );
                }
              },
            )),
          ],
        ),
      ),
    );
  }
}
