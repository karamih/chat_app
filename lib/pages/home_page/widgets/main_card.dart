import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainCard extends StatelessWidget {
  final String title;
  final String pathIcon;
  final bool isActive;
  final VoidCallback? onPressed;

  const MainCard(
      {super.key,
      required this.title,
      required this.pathIcon,
      required this.isActive,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        if (isActive) {
          onPressed?.call();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text(
                'This card is unavailable for now',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              backgroundColor: Colors.black26,
              duration: const Duration(seconds: 3),
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
      child: Container(
        width: width * 0.42,
        height: width * 0.7,
        decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black12,
                  spreadRadius: -5,
                  offset: Offset(0, 1),
                  blurRadius: 2),
            ]),
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Text(
              title,
              style: const TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  letterSpacing: 2),
            ),
            Expanded(child: SvgPicture.asset(pathIcon)),
          ],
        ),
      ),
    );
  }
}
