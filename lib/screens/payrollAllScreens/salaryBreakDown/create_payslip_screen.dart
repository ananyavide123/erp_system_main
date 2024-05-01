import 'package:erp_system/reusables/buttons.dart';
import 'package:flutter/material.dart';
import '../../../reusables/custom_text_form_field.dart';
import '../../../reusables/sized_box_hw.dart';

Future<void> createPayslipDialog(BuildContext context) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext ctxt) {
      return AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Create Memo",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        content: const CreatePayslipScreen(),
      );
    },
  );
}

class CreatePayslipScreen extends StatefulWidget {
  const CreatePayslipScreen({super.key});

  @override
  State<CreatePayslipScreen> createState() => _CreatePayslipScreenState();
}

class _CreatePayslipScreenState extends State<CreatePayslipScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
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
                SizedBox(
                  height: 400,
                  width: 300,
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
                SizedBox(
                  height: 400,
                  width: 300,
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
                        action: () {},
                        submitTitle: "Create",
                      ),
                    ],
                  ),
                ),
                wb20,
                SizedBox(
                  height: 400,
                  width: 300,
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
