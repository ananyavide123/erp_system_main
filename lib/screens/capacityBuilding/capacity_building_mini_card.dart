import 'package:flutter/material.dart';

import '../../reusables/colors.dart';
import '../../reusables/custom_card.dart';

class CapacityBuildingMiniCard extends StatefulWidget {
  const CapacityBuildingMiniCard({super.key});

  @override
  State<CapacityBuildingMiniCard> createState() => _CapacityBuildingMiniCardState();
}

class _CapacityBuildingMiniCardState extends State<CapacityBuildingMiniCard> {
  static List<String> amount = [
    "350",
    "800",
    "300",
    "70",
  ];
  static List<String> title = [
    "Total training request",
    "Total staff trained",
    "Total training done",
    "Staff training rate",
  ];
  static List<IconData> amountIcon = [
    Icons.psychology,
    Icons.psychology,
    Icons.psychology,
    Icons.psychology,
  ];
  static List<Color> circleIconColor = [
    creditOut,
    creditIn,
    green,
    withdrawal,
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      key: Key("card_builder_at_${DateTime.now().toIso8601String()}"),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 2.5,
      ),
      itemCount: title.length,
      itemBuilder: (context, index) {
        return CustomCard(
          circleIconColor: circleIconColor[index],
          amount: amount[index],
          title: title[index],
          amountIcon: amountIcon[index],
        );
      },
    );
  }
}
