import 'package:flutter/material.dart';

import '../../../reusables/buttons.dart';
import '../../dashboard/dashboard_card.dart';
import 'salary_payslip_screen.dart';
import 'tax_table.dart';

class TaxDefinitionsScreen extends StatelessWidget {
  const TaxDefinitionsScreen({super.key});

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
                title: "Tax Definitions",
                isTopPadding: false,
              ),
              CTAButton(
                width: size.width / 5,
                isTopPadding: false,
                action: () {
                  createTaxDialog(context);
                },
                submitTitle: "Create Tax Definition",
              ),
            ],
          ),
        ),
        SizedBox(
          height: size.height - 422,
          child: const TaxTable(),
        ),
      ],
    );
  }
}
