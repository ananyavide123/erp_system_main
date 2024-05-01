import 'package:flutter/material.dart';

import '../../reusables/buttons.dart';
import '../../reusables/colors.dart';
import '../../reusables/custom_container.dart';
import '../../reusables/sized_box_hw.dart';
import '../dashboard/dashboard_card.dart';
import 'maintenance_details_screen.dart';
import 'maintenance_mini_card.dart';
import 'schedule_maintenance_screen.dart';

class MaintenanceScreen extends StatefulWidget {
  const MaintenanceScreen({super.key});

  @override
  State<MaintenanceScreen> createState() => _MaintenanceScreenState();
}

class _MaintenanceScreenState extends State<MaintenanceScreen> {
  bool showMaintenanceScreen = false;
  bool showMaintenanceScreenBody = true;

  ///toggle screen
  void toggleMaintenanceScreen() {
    if (showMaintenanceScreen) {
      setState(() {
        showMaintenanceScreenBody = true;
        showMaintenanceScreen = false;
      });
    } else {
      setState(() {
        showMaintenanceScreenBody = false;
        showMaintenanceScreen = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return showMaintenanceScreen
        ? Container(
            color: secondaryColor,
            width: size.width,
            child: Column(
              children: [
                CustomBackButton(action: toggleMaintenanceScreen),
                const SecondMaintenanceScreen(),
              ],
            ),
          )
        : Column(
            children: [
              const MaintenanceMiniCard(),
              CustomContainer(
                height: 70,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const PageHeader(
                        title: 'Schedule a Maintenance',
                        isTopPadding: false,
                      ),
                      CTAButton(
                        width: size.width / 5,
                        isTopPadding: false,
                        action: () {
                          toggleMaintenanceScreen();
                        },
                        submitTitle: "Schedule Maintenance",
                      ),
                    ],
                  ),
                ),
              ),
              hb10,
              const MaintenanceDetailsScreen(),
            ],
          );
  }
}
