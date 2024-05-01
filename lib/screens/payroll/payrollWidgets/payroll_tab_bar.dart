import 'package:flutter/material.dart';

import '../../../../reusables/colors.dart';
import '../../../reusables/custom_container.dart';
import '../../../reusables/sized_box_hw.dart';
import 'pay_slips_screen.dart';
import 'payroll_tab_screen.dart';
import 'sallary_breakdown_screen.dart';
import 'tax_definition_screen.dart';

class PayrollScreenBody extends StatefulWidget {
  const PayrollScreenBody({super.key});

  @override
  State<PayrollScreenBody> createState() => _PayrollScreenBodyState();
}

class _PayrollScreenBodyState extends State<PayrollScreenBody> {
  int selectedPayrollTabIndex = 0;
  String selectedPayrollTab = '';
  List<String> payrollTabList = [
    "Salary breakdown",
    "Tax Definitions",
    "Payslips",
    "Payroll",
  ];
  List<Widget> payrollTabsScreens = [
    const SallaryBreakdownScreen(),
    const TaxDefinitionsScreen(),
    const PaySlipsScreen(),
    const PayrollTabScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        hb10,
        CustomContainer(
          height: 70,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                payrollTabList.length,
                (index) {
                  selectedPayrollTab = payrollTabList[selectedPayrollTabIndex];
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectedPayrollTabIndex = index;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            textAlign: TextAlign.center,
                            payrollTabList[index],
                            style: TextStyle(
                              color: selectedPayrollTabIndex == index ? primaryColor : black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        hb10,
        CustomContainer(
          height: size.height - 300,
          child: payrollTabsScreens[selectedPayrollTabIndex],
        ),
      ],
    );
  }
}
