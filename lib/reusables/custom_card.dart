import 'package:flutter/material.dart';

import 'colors.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    this.subTitle,
    this.iconColor,
    this.amountIcon,
    this.subTitleIcon,
    required this.title,
    required this.amount,
    this.circleIconColor,
  });
  final String title;
  final String amount;
  final String? subTitle;
  final Color? iconColor;
  final IconData? amountIcon;
  final Color? circleIconColor;
  final IconData? subTitleIcon;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: size.width,
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            ListTile(
              title: Text(
                amount,
                style: const TextStyle(fontSize: 25, overflow: TextOverflow.ellipsis),
              ),
              subtitle: Text(
                title,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: CircleAvatar(
                backgroundColor: circleIconColor?.withOpacity(0.3),
                radius: 20,
                child: Icon(amountIcon, color: circleIconColor),
              ),
            ),
            Visibility(
              visible: subTitle != '',
              child: ListTile(
                leading: Icon(
                  subTitleIcon,
                  color: iconColor ?? green,
                ),
                title: Text(
                  subTitle ?? '',
                  style: const TextStyle(overflow: TextOverflow.ellipsis, fontSize: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
