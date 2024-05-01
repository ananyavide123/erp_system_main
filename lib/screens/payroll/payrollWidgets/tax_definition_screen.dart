import 'package:flutter/material.dart';

import '../../../reusables/buttons.dart';
import '../../../reusables/snack_bar.dart';
import '../../dashboard/dashboard_card.dart';
import '../../staff/all_staff_table.dart';

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
                  showSnackBar(context, 'Under Development');
                },
                submitTitle: "Create Tax Definition",
              ),
            ],
          ),
        ),
        SizedBox(
          height: size.height - 380,
          child: const AllStaffTable(),
        ),
      ],
    );
  }
}
