import 'package:flutter/material.dart';

import '../../reusables/buttons.dart';
import '../../reusables/colors.dart';
import '../../reusables/custom_container.dart';
import '../../reusables/sized_box_hw.dart';
import '../dashboard/dashboard_card.dart';
import 'create_budget_screen.dart';
import 'office_budget_mini_card.dart';
import 'office_table.dart';

class OfficeBudgetScreen extends StatefulWidget {
  const OfficeBudgetScreen({super.key});

  @override
  State<OfficeBudgetScreen> createState() => _OfficeBudgetScreenState();
}

class _OfficeBudgetScreenState extends State<OfficeBudgetScreen> {
  bool showOfficeBudgetScreen = false;
  bool showOfficeBudgetScreenBody = true;

  void toggleOfficeBudgetScreen() {
    if (showOfficeBudgetScreen) {
      setState(() {
        showOfficeBudgetScreenBody = true;
        showOfficeBudgetScreen = false;
      });
    } else {
      setState(() {
        showOfficeBudgetScreenBody = false;
        showOfficeBudgetScreen = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return showOfficeBudgetScreen
        ? Container(
            color: secondaryColor,
            width: size.width,
            child: Column(
              children: [
                CustomBackButton(action: toggleOfficeBudgetScreen),
                const SecondOfficeBudget(),
              ],
            ),
          )
        : Column(
            children: [
              const OfficeBudgetMiniCard(),
              hb10,
              CustomContainer(
                height: 70,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const PageHeader(
                        title: "Create a Budget",
                        isTopPadding: false,
                      ),
                      CTAButton(
                        width: size.width / 5,
                        isTopPadding: false,
                        action: () {
                          toggleOfficeBudgetScreen();
                        },
                        submitTitle: "Create Budget",
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
                    const PageHeader(title: 'Budget History'),
                    SizedBox(
                      height: size.height - 390,
                      child: const OfficeTable(),
                    ),
                  ],
                ),
              ),
            ],
          );
  }
}
