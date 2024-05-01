import 'package:flutter/material.dart';

import '../../reusables/colors.dart';
import '../../reusables/custom_card.dart';

class OfficeBudgetMiniCard extends StatefulWidget {
  const OfficeBudgetMiniCard({super.key});

  @override
  State<OfficeBudgetMiniCard> createState() => _OfficeBudgetMiniCardState();
}

class _OfficeBudgetMiniCardState extends State<OfficeBudgetMiniCard> {
  static List<String> amount = [
    "23,000,000",
    "10,000,000",
    "13,000,000",
    "48%",
  ];
  static List<String> title = [
    "Total annual budget",
    "Amount used, YTD",
    "Total budget balance",
    "Budget % used",
  ];
  static List<String> subTitle = [
    "5% more than last quarter",
    "",
    "",
    "",
  ];
  static List<IconData> amountIcon = [
    Icons.monetization_on,
    Icons.monetization_on,
    Icons.monetization_on,
    Icons.monetization_on,
  ];
  static List<IconData> subTitleIcon = [
    Icons.arrow_upward,
    Icons.arrow_downward,
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
