import 'package:flutter/material.dart';

import '../../reusables/colors.dart';

class NotificationTile extends StatelessWidget {
  const NotificationTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 4),
      child: Container(
        decoration: BoxDecoration(
          color: secondaryColor,
          border: Border.all(color: black.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage("assets/images/bg1.jpg"),
          ),
          trailing: Icon(Icons.more_vert),
          subtitle: Text("1day ago"),
          title: Text("Your payment invoice request has approved by Admin"),
        ),
      ),
    );
  }
}
