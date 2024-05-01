import 'package:erp_system/reusables/buttons.dart';
import 'package:flutter/material.dart';
import '../../reusables/colors.dart';
import '../../reusables/custom_text_form_field.dart';
import '../../reusables/sized_box_hw.dart';
import 'salary_payslip_screen.dart';

class SecondPayrollScreen extends StatefulWidget {
  const SecondPayrollScreen({super.key});

  @override
  State<SecondPayrollScreen> createState() => _SecondPayrollScreenState();
}

class _SecondPayrollScreenState extends State<SecondPayrollScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: secondaryColor,
        ),
        height: 500,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20, left: 20),
              child: Text(
                "Create Salary Definition",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            hb10,
            Row(
              children: [
                Container(
                  height: 400,
                  width: 300,
                  color: secondaryColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomTextFormField(
                        title: 'Title',
                        hintText: 'Select option',
                      ),
                      hb10,
                      const CustomTextFormField(
                        title: 'Allowance',
                        hintText: 'Enter amount in Naira',
                      ),
                      hb10,
                      const CustomTextFormField(
                        title: 'Net Salary',
                        hintText: 'Enter amount in Naira',
                      ),
                    ],
                  ),
                ),
                wb20,
                Container(
                  height: 400,
                  width: 300,
                  color: secondaryColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomTextFormField(
                        title: 'Level',
                        hintText: 'Select option',
                      ),
                      hb10,
                      const CustomTextFormField(
                        title: 'Gross Salary',
                        hintText: 'Enter amount in Naira',
                      ),
                      hb10,
                      CTAButton(
                        action: () {
                          showPayrollDialog(context);
                        },
                        submitTitle: "Create",
                      ),
                    ],
                  ),
                ),
                wb20,
                Container(
                  height: 400,
                  width: 300,
                  color: secondaryColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomTextFormField(
                        title: 'Basic salary',
                        hintText: 'Enter amount in Naira',
                      ),
                      hb10,
                      const CustomTextFormField(
                        title: 'Deductions',
                        hintText: 'Enter amount in',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
