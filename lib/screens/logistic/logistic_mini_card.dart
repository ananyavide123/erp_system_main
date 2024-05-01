import 'package:flutter/material.dart';

import '../../reusables/colors.dart';
import '../../reusables/custom_card.dart';

class LogisticMiniCard extends StatefulWidget {
  const LogisticMiniCard({super.key});

  @override
  State<LogisticMiniCard> createState() => _LogisticMiniCardState();
}

class _LogisticMiniCardState extends State<LogisticMiniCard> {
  static List<String> amount = [
    "350",
    "5,000,000",
    "70",
    "280",
  ];
  static List<String> title = [
    "Total request made",
    "Total cost incurred",
    "Pending Request",
    "Approved request",
  ];
  static List<String> subTitle = [
    "50 more than last year",
    "",
    "",
    "2% more than last year",
  ];
  static List<IconData> amountIcon = [
    Icons.airport_shuttle,
    Icons.airport_shuttle,
    Icons.airport_shuttle,
    Icons.airport_shuttle,
  ];
  static List<IconData> subTitleIcon = [
    Icons.arrow_upward,
    Icons.arrow_downward,
    Icons.arrow_upward,
    Icons.arrow_downward,
  ];
  static List<Color> circleIconColor = [
    creditOut,
    creditIn,
    green,
    withdrawal,
  ];
  static List<Color> iconColor = [
    green,
    red,
    green,
    red,
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
