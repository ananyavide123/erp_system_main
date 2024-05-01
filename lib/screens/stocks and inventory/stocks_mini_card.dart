import 'package:flutter/material.dart';

import '../../reusables/colors.dart';
import '../../reusables/custom_card.dart';

class StocksMiniCard extends StatefulWidget {
  const StocksMiniCard({super.key});

  @override
  State<StocksMiniCard> createState() => _StocksMiniCardState();
}

class _StocksMiniCardState extends State<StocksMiniCard> {
  static List<String> amount = [
    "15",
    "800",
    "5,000,000",
    "200",
  ];
  static List<String> title = [
    "Categories",
    "Total items",
    "Total items cost",
    "items low in stock",
  ];
  static List<String> subTitle = [
    "2 more than last year",
    "10 more than last year",
    "2.5% less than last year",
    "20 more than last week",
  ];
  static List<IconData> amountIcon = [
    Icons.bar_chart,
    Icons.bar_chart,
    Icons.bar_chart,
    Icons.bar_chart,
  ];
  static List<IconData> subTitleIcon = [
    Icons.arrow_upward,
    Icons.arrow_upward,
    Icons.arrow_downward,
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
    red,
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
