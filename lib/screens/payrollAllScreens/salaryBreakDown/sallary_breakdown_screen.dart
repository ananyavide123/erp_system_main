import 'package:flutter/material.dart';

import '../../../reusables/buttons.dart';
import '../../dashboard/dashboard_card.dart';
import 'create_payslip_screen.dart';
import 'salary_table.dart';

class SallaryBreakdownScreen extends StatelessWidget {
  const SallaryBreakdownScreen({super.key});

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
                title: "Salary Defination",
                isTopPadding: false,
              ),
              CTAButton(
                width: size.width / 5,
                isTopPadding: false,
                action: () {
                  createPayslipDialog(context);
                },
                submitTitle: "Salary Defination",
              ),
            ],
          ),
        ),
        SizedBox(
          height: size.height - 422,
          child: const SalaryTable(),
        ),
      ],
    );
  }
}
