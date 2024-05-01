import 'package:flutter/material.dart';

import '../../reusables/colors.dart';
import '../../reusables/custom_card.dart';

class MaintenanceMiniCard extends StatefulWidget {
  const MaintenanceMiniCard({super.key});

  @override
  State<MaintenanceMiniCard> createState() => _MaintenanceMiniCardState();
}

class _MaintenanceMiniCardState extends State<MaintenanceMiniCard> {
  static List<String> amount = [
    "25",
    "25",
    "25",
    "25",
  ];
  static List<String> title = [
    "Scheduled maintenance",
    "Completed maintenance",
    "Pending maintenance",
    "Overdue maintenance",
  ];
  static List<String> subTitle = [
    "2more than last quarter",
    "2more than last quarter",
    "2more than last quarter",
    "2more than last quarter",
  ];
  static List<IconData> amountIcon = [
    Icons.book_sharp,
    Icons.book_sharp,
    Icons.book_sharp,
    Icons.book_sharp,
  ];
  static List<IconData> subTitleIcon = [
    Icons.arrow_upward,
    Icons.arrow_upward,
    Icons.arrow_upward,
    Icons.arrow_upward,
  ];
  static List<Color> circleIconColor = [
    creditOut,
    creditIn,
    green,
    withdrawal,
  ];
  static List<Color> iconColor = [
    green,
    green,
    green,
    green,
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      key: Key("card_builder_at_${DateTime.now().toIso8601String()}"),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 2,
      ),
      itemCount: title.length,
      itemBuilder: (context, index) {
        return CustomCard(
          iconColor: iconColor[index],
          circleIconColor: circleIconColor[index],
          amount: amount[index],
          title: title[index],
          subTitle: subTitle[index],
          amountIcon: amountIcon[index],
          subTitleIcon: subTitleIcon[index],
        );
      },
    );
  }
}
