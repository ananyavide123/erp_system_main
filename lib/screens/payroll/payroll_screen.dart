import 'package:flutter/material.dart';

import '../../reusables/buttons.dart';
import '../../reusables/colors.dart';
import 'create_payslip_screen.dart';
import 'payrollWidgets/payroll_tab_bar.dart';
import 'payroll_mini_card.dart';

class PayrollScreen extends StatefulWidget {
  const PayrollScreen({super.key});

  @override
  State<PayrollScreen> createState() => _PayrollScreenState();
}

class _PayrollScreenState extends State<PayrollScreen> {
  bool showPayrollScreen = false;
  bool showPayrollScreenBody = true;

  ///toggle screen
  void togglePayrollScreen() {
    if (showPayrollScreen) {
      setState(() {
        showPayrollScreenBody = true;
        showPayrollScreen = false;
      });
    } else {
      setState(() {
        showPayrollScreenBody = false;
        showPayrollScreen = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return showPayrollScreen
        ? Container(
            color: secondaryColor,
            width: size.width,
            child: Column(
              children: [
                CustomBackButton(action: togglePayrollScreen),
                const SecondPayrollScreen(),
              ],
            ),
          )
        : const Column(
            children: [
              PayrollMiniCard(),

              /// all tabs screens
              PayrollScreenBody(),
            ],
          );
  }
}
