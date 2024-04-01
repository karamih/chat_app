import 'package:flutter/material.dart';

class Restart extends StatelessWidget {
  final VoidCallback onPressed;
  const Restart({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
          width: width * 0.2,
          height: width * 0.15,
          decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.red[300]!)),
          child: Center(
            child: Text(
              'Reset',
              style: TextStyle(
                  color: Colors.red[300],
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          )),
    );
  }
}
