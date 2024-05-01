import 'package:flutter/material.dart';

import 'colors.dart';

class IncreaseWidth extends StatelessWidget {
  const IncreaseWidth({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
      color: red,
      width: size.width,
      child: const Center(
        child: Text(
          "Please increase your device width",
          style: TextStyle(
            color: white,
            fontSize: 45,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
