import 'package:flutter/material.dart';

import '../../reusables/buttons.dart';
import '../../reusables/colors.dart';
import '../../reusables/custom_container.dart';
import '../../reusables/sized_box_hw.dart';
import '../dashboard/dashboard_card.dart';
import 'procurement_mini_card.dart';
import 'procurement_table.dart';
import 'procurement_request_screen.dart';

class ProcurementScreen extends StatefulWidget {
  const ProcurementScreen({super.key});

  @override
  State<ProcurementScreen> createState() => _ProcurementScreenState();
}

class _ProcurementScreenState extends State<ProcurementScreen> {
  bool showProcurementScreen = false;
  bool showProcurementScreenBody = true;
  String procurementTitle = "Procurement Request";

  void toggleProcurementScreen() {
    if (showProcurementScreen) {
      setState(() {
        showProcurementScreenBody = true;
        showProcurementScreen = false;
      });
    } else {
      setState(() {
        showProcurementScreenBody = false;
        showProcurementScreen = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    double tfw = size.width / 5;
    return showProcurementScreen
        ? SingleChildScrollView(
            child: Container(
              color: secondaryColor,
              width: size.width,
              child: Column(
                children: [
                  CustomBackButton(action: toggleProcurementScreen),
                  const ProcurementRequestScreen(),
                ],
              ),
            ),
          )
        : Column(
            children: [
              const ProcurementMiniCard(),
              hb10,
              CustomContainer(
                height: 70,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PageHeader(
                        title: procurementTitle,
                        isTopPadding: false,
                      ),
                      CTAButton(
                        width: tfw,
                        isTopPadding: false,
                        action: () {
                          toggleProcurementScreen();
                        },
                        submitTitle: "Make $procurementTitle",
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
                    PageHeader(title: procurementTitle),
                    SizedBox(
                      height: size.height - 390,
                      child: const ProcurementTable(),
                    ),
                  ],
                ),
              ),
            ],
          );
  }
}
