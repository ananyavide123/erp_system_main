import 'package:flutter/material.dart';

import '../../../reusables/sized_box_hw.dart';
import '../../logistic/logistic_mini_card.dart';
import '../payrollWidgets/payroll_tab_bar.dart';

class PayrollScreenWithTabbar extends StatelessWidget {
  const PayrollScreenWithTabbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const LogisticMiniCard(),
        hb10,
        const PayrollScreenBody(),
      ],
    );
  }
}
