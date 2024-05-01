import 'package:flutter/material.dart';

import 'colors.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText({
    super.key,
    required this.title,
    required this.value,
  });
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: black,
              ),
            ),
            TextSpan(
              text: value,
              style: const TextStyle(
                color: black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
