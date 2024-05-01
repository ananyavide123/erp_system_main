import 'package:flutter/material.dart';

import '../../../reusables/buttons.dart';
import '../../dashboard/dashboard_card.dart';
import 'create_payroll.dart';
import 'payroll_table.dart';

class PayrollTabScreen extends StatelessWidget {
  const PayrollTabScreen({super.key});

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
                title: "Employee Payroll History",
                isTopPadding: false,
              ),
              CTAButton(
                width: size.width / 5,
                isTopPadding: false,
                action: () {
                  payrollDialog(context);
                },
                submitTitle: "Create Payroll",
              ),
            ],
          ),
        ),
        SizedBox(
          height: size.height - 422,
          child: const PayrollTable(),
        ),
      ],
    );
  }
}
