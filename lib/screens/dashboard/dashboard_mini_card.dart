import 'package:flutter/material.dart';

import '../../reusables/colors.dart';
import '../../reusables/custom_card.dart';

class DashboardMiniCard extends StatefulWidget {
  const DashboardMiniCard({super.key});

  @override
  State<DashboardMiniCard> createState() => _DashboardMiniCardState();
}

class _DashboardMiniCardState extends State<DashboardMiniCard> {
  static List<String> amount = [
    "250",
    "100",
    "10",
    "10",
  ];
  static List<String> title = [
    "Total number of staff",
    "Total application",
    "Total projects",
    "Total departments",
  ];
  static List<String> subTitle = [
    "12 more than last quarter",
    "0.2 lower than last quarter",
    "2% more than last quarter",
    "",
  ];
  static List<IconData> amountIcon = [
    Icons.group,
    Icons.settings_applications,
    Icons.energy_savings_leaf,
    Icons.groups,
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
