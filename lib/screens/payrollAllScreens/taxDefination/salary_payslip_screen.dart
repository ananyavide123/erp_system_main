import 'package:erp_system/reusables/buttons.dart';
import 'package:erp_system/reusables/custom_text_form_field.dart';
import 'package:erp_system/reusables/sized_box_hw.dart';
import 'package:flutter/material.dart';


Future<void> createTaxDialog(BuildContext context) {
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
        content: const SalaryTaxScreen(),
      );
    },
  );
}



class SalaryTaxScreen extends StatefulWidget {
  const SalaryTaxScreen({super.key});

  @override
  State<SalaryTaxScreen> createState() => _SalaryTaxScreenState();
}

class _SalaryTaxScreenState extends State<SalaryTaxScreen> {
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
