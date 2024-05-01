import 'package:flutter/material.dart';

import '../../reusables/colors.dart';
import '../../reusables/custom_card.dart';

class ProcurementMiniCard extends StatefulWidget {
  const ProcurementMiniCard({super.key});

  @override
  State<ProcurementMiniCard> createState() => _ProcurementMiniCardState();
}

class _ProcurementMiniCardState extends State<ProcurementMiniCard> {
  static List<String> amount = [
    "350",
    "8,000,000",
    "20",
    "330",
  ];
  static List<String> title = [
    "Total request made",
    "Total cost incurred",
    "Pending request",
    "Approved request",
  ];
  static List<String> subTitle = [
    "12 more than last quarter",
    "",
    "",
    "2 more than last quarter",
  ];
  static List<IconData> amountIcon = [
    Icons.shopping_bag,
    Icons.shopping_bag,
    Icons.shopping_bag,
    Icons.shopping_bag,
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
