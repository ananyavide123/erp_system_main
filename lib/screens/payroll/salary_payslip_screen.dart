import 'package:erp_system/reusables/buttons.dart';
import 'package:erp_system/reusables/custom_text_form_field.dart';
import 'package:erp_system/reusables/sized_box_hw.dart';
import 'package:flutter/material.dart';

import '../../reusables/colors.dart';

showPayrollDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return const AlertDialog(
        backgroundColor: secondaryColor,
        title: Padding(
          padding: EdgeInsets.only(left: 29),
          child: Text(
            "Schedule Maintenance",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        content: ThirdPayrollScreen(),
      );
    },
  );
}

class ThirdPayrollScreen extends StatefulWidget {
  const ThirdPayrollScreen({super.key});

  @override
  State<ThirdPayrollScreen> createState() => _ThirdPayrollScreenState();
}

class _ThirdPayrollScreenState extends State<ThirdPayrollScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: SizedBox(
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Create Tax Definition",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            hb30,
            Row(
              children: [
                const CustomTextFormField(
                  title: 'Tax type',
                  hintText: 'Enter tax name',
                ),
                wb15,
                const CustomTextFormField(
                  title: '% value',
                  hintText: 'Enter % value',
                ),
              ],
            ),
            hb20,
            CTAButton(
              action: () {},
              submitTitle: 'Create',
            ),
          ],
        ),
      ),
    );
  }
}
