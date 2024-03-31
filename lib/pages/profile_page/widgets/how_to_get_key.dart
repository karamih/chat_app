import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../config/consts.dart';

class LinkText extends StatelessWidget {
  final String text;

  const LinkText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _launchUrl();
        print('clicked');
      },
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.blue,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(Consts.url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $Consts.url');
    }
  }
}
