import 'package:erp_system/reusables/buttons.dart';
import 'package:flutter/material.dart';

class SignOutPage extends StatelessWidget {
  const SignOutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CTAButton(
          action: () {},
          submitTitle: 'Sign Out',
        ),
      ],
    );
  }
}
