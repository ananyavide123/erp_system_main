import 'package:flutter/material.dart';

import '../../reusables/buttons.dart';
import '../../reusables/custom_container.dart';
import '../../reusables/sized_box_hw.dart';
import '../dashboard/dashboard_card.dart';
import 'logistic_mini_card.dart';
import 'logistic_request_screen.dart';
import 'logistic_table.dart';

class LogisticScreen extends StatefulWidget {
  const LogisticScreen({super.key});

  @override
  State<LogisticScreen> createState() => _MaintenanceScreenState();
}

class _MaintenanceScreenState extends State<LogisticScreen> {
  bool showLogisticScreen = false;
  bool showLogisticScreenBody = true;
  String logisticTitle = "Logistic Request";

  ///toggle screen
  void toggleLogisticScreen() {
    if (showLogisticScreen) {
      setState(() {
        showLogisticScreenBody = true;
        showLogisticScreen = false;
      });
    } else {
      setState(() {
        showLogisticScreenBody = false;
        showLogisticScreen = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return showLogisticScreen
        ? SingleChildScrollView(
            child: Column(
              children: [
                CustomBackButton(action: toggleLogisticScreen),
                const SecondLogisticScreen(),
              ],
            ),
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LogisticMiniCard(),
              hb10,
              CustomContainer(
                height: 70,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PageHeader(
                        title: logisticTitle,
                        isTopPadding: false,
                      ),
                      CTAButton(
                        width: size.width / 5,
                        isTopPadding: false,
                        action: () {
                          toggleLogisticScreen();
                        },
                        submitTitle: "Make $logisticTitle",
                      ),
                    ],
                  ),
                ),
              ),
              hb10,
              CustomContainer(
                height: size.height - 340,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PageHeader(title: 'All $logisticTitle'),
                    SizedBox(
                      height: size.height - 390,
                      child: const LogisticTable(),
                    ),
                  ],
                ),
              ),
            ],
          );
  }
}
