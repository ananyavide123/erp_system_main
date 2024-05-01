import 'package:erp_system/reusables/buttons.dart';
import 'package:flutter/material.dart';

import 'package:erp_system/reusables/sized_box_hw.dart';

import '../../../reusables/custom_dropdown.dart';
import '../../../reusables/custom_text_form_field.dart';

Future<void> createPayrollDialog(BuildContext context) {
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
        content: const SPayrollPayroll(),
      );
    },
  );
}

class SPayrollPayroll extends StatefulWidget {
  const SPayrollPayroll({super.key});

  @override
  State<SPayrollPayroll> createState() => _PayrollPayrollState();
}

class _PayrollPayrollState extends State<SPayrollPayroll> {
  String selectedStaffName = '';
  List<String> staffList = ["HR", "Manager", "TL"];

  String selectedTitle = '';
  List<String> titleList = ["HR", "Manager", "TL"];

  String selectedLevel = '';
  List<String> levelList = ["Start", "Final", "Semifinal"];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 200,
            width: 900,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Text(
                      "Create Payroll",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                hb10,
                const Text(
                  "Basic Information",
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                ),
                hb40,
                Row(
                  children: [
                    SizedBox(
                      height: 90,
                      width: 250,
                      child: Column(
                        children: [
                          CustomDropdownWithTitle(
                            hintText: "Select Staff",
                            title: 'Staff Name',
                            value: selectedStaffName,
                            items: staffList,
                            onChanged: (newValue) {
                              if (newValue != null) {
                                setState(() {
                                  selectedStaffName = newValue;
                                });
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    wb20,
                    SizedBox(
                      height: 90,
                      width: 250,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomDropdownWithTitle(
                            hintText: "Select title",
                            title: 'Title',
                            value: selectedTitle,
                            items: titleList,
                            onChanged: (newValue) {
                              if (newValue != null) {
                                setState(() {
                                  selectedTitle = newValue;
                                });
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    wb20,
                    SizedBox(
                      height: 90,
                      width: 250,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomDropdownWithTitle(
                            hintText: "Select level",
                            title: 'Level',
                            value: selectedLevel,
                            items: levelList,
                            onChanged: (newValue) {
                              if (newValue != null) {
                                setState(() {
                                  selectedLevel = newValue;
                                });
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          hb10,
          SizedBox(
            height: 350,
            width: 900,
            child: Column(
              children: [
                const Text("Salary Structure"),
                hb10,
                Row(
                  children: [
                    const SizedBox(
                      height: 300,
                      width: 250,
                      child: Column(
                        children: [
                          CustomTextFormField(
                            hintText: 'Enter amount',
                            title: 'Basic salary',
                          ),
                          CustomTextFormField(
                            hintText: 'Enter amount',
                            title: 'Utility allowance',
                          ),
                          CustomTextFormField(
                            hintText: 'Enter amount',
                            title: 'Inconvenience allowance',
                          ),
                        ],
                      ),
                    ),
                    wb20,
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          height: 300,
                          width: 250,
                          child: const Column(
                            children: [
                              CustomTextFormField(
                                hintText: 'Enter amount',
                                title: 'Housing allowance',
                              ),
                              CustomTextFormField(
                                hintText: 'Enter amount',
                                title: 'Productivity allowance',
                              ),
                              CustomTextFormField(
                                hintText: ' amount',
                                title: 'Gross Salary',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    wb20,
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          height: 300,
                          width: 250,
                          child: const Column(
                            children: [
                              CustomTextFormField(
                                hintText: 'Enter amount',
                                title: 'Transport allowance',
                              ),
                              CustomTextFormField(
                                hintText: 'Enter amount',
                                title: 'Communication allowance',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          hb10,
          SizedBox(
            height: 150,
            width: 900,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Text(
                      "Deductions",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                hb40,
                Row(
                  children: [
                    const SizedBox(
                      height: 90,
                      width: 250,
                      child: Column(
                        children: [
                          CustomTextFormField(
                            title: 'TAX/PAYE',
                            hintText: 'Enter amount',
                          ),
                        ],
                      ),
                    ),
                    wb20,
                    const SizedBox(
                      height: 90,
                      width: 250,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextFormField(
                            title: 'Employee pension',
                            hintText: 'Enter amount',
                          ),
                        ],
                      ),
                    ),
                    wb20,
                    const SizedBox(
                      height: 90,
                      width: 250,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextFormField(
                            title: 'Total deduction',
                            hintText: 'Amount',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          hb10,
          SizedBox(
            height: 200,
            width: 900,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Column(
                  children: [
                    Text(
                      "Net Salary",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    CustomTextFormField(
                      title: 'Net salary',
                      hintText: 'Amount',
                    ),
                  ],
                ),
                hb10,
                CTAButton(
                  action: () {},
                  submitTitle: 'Create Payroll',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
