import 'package:flutter/material.dart';

import '../../reusables/buttons.dart';
import '../../reusables/custom_container.dart';
import '../dashboard/dashboard_card.dart';
import '../../reusables/colors.dart';
import '../../reusables/sized_box_hw.dart';
import 'capacity_building_mini_card.dart';
import 'capacity_building_table.dart';
import 'training_request_screen.dart';

class CapacityBuilding extends StatefulWidget {
  const CapacityBuilding({super.key});

  @override
  State<CapacityBuilding> createState() => _CapacityBuildingScreenState();
}

class _CapacityBuildingScreenState extends State<CapacityBuilding> {
  bool showCapacityScreen = false;
  bool showCapacityScreenBody = true;
  String trainingTitle = "Training Request";

  void toggleCapacityScreen() {
    if (showCapacityScreen) {
      setState(() {
        showCapacityScreenBody = true;
        showCapacityScreen = false;
      });
    } else {
      setState(() {
        showCapacityScreenBody = false;
        showCapacityScreen = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    double tfw = size.width / 5;
    return showCapacityScreen
        ? Container(
            color: secondaryColor,
            width: size.width,
            child: Column(
              children: [
                CustomBackButton(action: toggleCapacityScreen),
                const SecondCapacityBuilding(),
              ],
            ),
          )
        : Column(
            children: [
              const CapacityBuildingMiniCard(),
              hb10,
              CustomContainer(
                height: 70,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PageHeader(
                        title: trainingTitle,
                        isTopPadding: false,
                      ),
                      CTAButton(
                        width: tfw,
                        isTopPadding: false,
                        action: () {
                          toggleCapacityScreen();
                        },
                        submitTitle: "Make $trainingTitle",
                      ),
                    ],
                  ),
                ),
              ),
              hb10,
              CustomContainer(
                height: size.height - 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const PageHeader(title: 'All Trannings'),
                    SizedBox(
                      height: size.height - 345,
                      child: const CapacityTable(),
                    ),
                  ],
                ),
              ),
            ],
          );
  }
}
