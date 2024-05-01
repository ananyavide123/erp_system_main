import 'package:flutter/material.dart';

import 'colors.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    this.height,
    required this.child,
  });
  final Widget? child;
  final double? height;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        height: height ?? (size.height - 210),
        width: size.width,
        child: child,
      ),
    );
  }
}

class CountCard extends StatelessWidget {
  const CountCard({
    super.key,
    required this.title,
    required this.count,
  });
  final String title;
  final String count;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: ListTile(
        title: Text(
          count,
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(title),
      ),
    );
  }
}
