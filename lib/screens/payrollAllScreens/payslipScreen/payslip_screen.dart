import 'package:flutter/material.dart';

import '../../../reusables/buttons.dart';
import '../../dashboard/dashboard_card.dart';
import '../payslip/create_payslip.dart';
import 'payslip_table.dart';

class PayslipScreen extends StatelessWidget {
  const PayslipScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const PageHeader(
                title: "Employee Payslip History",
                isTopPadding: false,
              ),
              CTAButton(
                width: size.width / 5,
                isTopPadding: false,
                action: () {
                  createPayrollDialog(context);
                },
                submitTitle: "Create Payslip",
              ),
            ],
          ),
        ),
        SizedBox(
          height: size.height - 422,
          child: const PayslipHistoryTable(),
        ),
      ],
    );
  }
}
