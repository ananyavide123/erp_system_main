import 'package:flutter/material.dart';

import '../../reusables/colors.dart';

class SideMenuTile extends StatelessWidget {
  const SideMenuTile({
    super.key,
    required this.icon,
    required this.title,
    required this.action,
    required this.selectedName,
  });

  final String title;
  final IconData icon;
  final String selectedName;
  final void Function() action;

  @override
  Widget build(BuildContext context) {
    final isSelected = selectedName == title;
    final backgroundColor = isSelected ? secondaryColor : primaryColor;
    final textColor = isSelected ? primaryColor : secondaryColor;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: textColor),
          borderRadius: const BorderRadius.all(Radius.circular(16 / 2)),
        ),
        child: ListTile(
          onTap: action,
          title: Text(
            title,
            style: TextStyle(color: textColor, overflow: TextOverflow.ellipsis),
          ),
          leading: Icon(icon, color: textColor),
        ),
      ),
    );
  }
}
