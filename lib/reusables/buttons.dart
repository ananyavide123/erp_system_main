import 'package:flutter/material.dart';

import 'colors.dart';
import 'responsive.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key, this.action});
  final void Function()? action;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: TextButton.icon(
        onPressed: action,
        icon: const Icon(
          Icons.arrow_back_ios,
          color: primaryColor,
        ),
        label: const Text(
          "Back",
          style: TextStyle(color: primaryColor),
        ),
      ),
    );
  }
}

class CTAButton extends StatelessWidget {
  const CTAButton({
    super.key,
    this.width,
    required this.action,
    this.isTopPadding = true,
    required this.submitTitle,
  });
  final double? width;
  final bool isTopPadding;
  final String submitTitle;
  final void Function()? action;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: isTopPadding ? 30 : 0),
      child: SizedBox(
        height: 45,
        width: width ?? 200,
        child: ElevatedButton(
          onPressed: action,
          style: OutlinedButton.styleFrom(
            backgroundColor: primaryColor,
            padding: EdgeInsets.symmetric(
              horizontal: 12 * 1.5,
              vertical: 12 / (Responsive.isMobile(context) ? 2 : 1),
            ),
          ),
          child: Text(
            submitTitle,
            style: const TextStyle(color: secondaryColor),
          ),
        ),
      ),
    );
  }
}
