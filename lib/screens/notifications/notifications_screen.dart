import 'package:flutter/material.dart';

import '../../reusables/buttons.dart';
import '../../reusables/colors.dart';
import '../../reusables/custom_container.dart';
import '../../reusables/sized_box_hw.dart';
import '../dashboard/dashboard_card.dart';
import 'notification_tile.dart';
import 'read_notification_screen.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool showNotificationScreen = false;
  bool showNotificationScreenBody = true;

  ///toggle screen
  void toggleNotificationScreen() {
    if (showNotificationScreen) {
      setState(() {
        showNotificationScreenBody = true;
        showNotificationScreen = false;
      });
    } else {
      setState(() {
        showNotificationScreenBody = false;
        showNotificationScreen = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return showNotificationScreen
        ? Container(
            color: secondaryColor,
            width: size.width,
            child: Column(
              children: [
                CustomBackButton(action: toggleNotificationScreen),
                const SecondNotificationScreen(),
              ],
            ),
          )
        : Column(
            children: [
              CustomContainer(
                height: 70,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const PageHeader(
                        title: 'Notification(3 unread)',
                        isTopPadding: false,
                      ),
                      CTAButton(
                        width: size.width / 5,
                        isTopPadding: false,
                        action: () {
                          toggleNotificationScreen();
                        },
                        submitTitle: "Mark All As Read",
                      ),
                    ],
                  ),
                ),
              ),
              hb10,
              CustomContainer(
                height: size.height - 135,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const PageHeader(title: 'Today'),
                    SizedBox(
                      height: size.height - 185,
                      child: ListView.builder(
                        itemCount: 50,
                        itemBuilder: (BuildContext context, int index) {
                          return const NotificationTile();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
  }
}
