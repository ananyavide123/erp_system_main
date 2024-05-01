import 'package:flutter/material.dart';

import '../../../reusables/buttons.dart';
import '../../../reusables/colors.dart';
import '../../../reusables/sized_box_hw.dart';

Future<void> payrollDialog(BuildContext context) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext ctxt) {
      return AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Payroll",
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
        content: const PayrollDialogPayroll(),
      );
    },
  );
}

class PayrollDialogPayroll extends StatefulWidget {
  const PayrollDialogPayroll({super.key});

  @override
  State<PayrollDialogPayroll> createState() => _PayrollDialogPayrollState();
}

class _PayrollDialogPayrollState extends State<PayrollDialogPayroll> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SizedBox(
      width: size.width / 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            height: 100,
            width: 1000,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 30, left: 10),
                          child: RichText(
                            text: const TextSpan(
                              text: 'Abubakar Alghazali ',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                              children: <TextSpan>[],
                            ),
                          ),
                        )
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "Managing Director | MD/CEO",
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: CTAButton(
                    action: () {},
                    submitTitle: 'EditPayslip',
                  ),
                ),
              ],
            ),
          ),
          hb10,
          Container(
            decoration: const BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            height: 500,
            width: 1000,
            child: Column(
              children: [
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text("Salary Payslip", style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "Month:January",
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                    wb60,
                    const Text(
                      "Year:2023",
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
                hb30,
                Row(
                  children: [
                    Container(
                      height: 400,
                      width: 300,
                      color: secondaryColor,
                      child: ListView(
                        children: [
                          Container(
                            color: Colors.black,
                            child: ListTile(
                              title: const Text(
                                "Salary Structure",
                                style: TextStyle(color: secondaryColor),
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    height: 50,
                                    width: 1,
                                    decoration: const BoxDecoration(
                                      color: secondaryColor,
                                      border: Border.symmetric(
                                        vertical: BorderSide(color: secondaryColor),
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 8),
                                    child: Text(
                                      "Amount",
                                      style: TextStyle(color: secondaryColor),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const ListTile(
                            title: Text("Basic Salary"),
                            trailing: Text("445,331"),
                          ),
                          const ListTile(
                            title: Text("Housing Allowance"),
                            trailing: Text("222,666"),
                          ),
                          const ListTile(
                            title: Text("Transport Allowance"),
                            trailing: Text("89,066"),
                          ),
                          const ListTile(
                            title: Text("Utility Allowance"),
                            trailing: Text("44,533"),
                          ),
                          const ListTile(
                            title: Text("Productivity"),
                            trailing: Text("89,066"),
                          ),
                          const ListTile(
                            title: Text("Communication Allowance"),
                            trailing: Text("66,800"),
                          ),
                          const ListTile(
                            title: Text("Inconvenience allowance"),
                            trailing: Text("66,800"),
                          ),
                          const ListTile(
                            title: Text("Gross Salary"),
                            trailing: Text("1,024,261"),
                          ),
                        ],
                      ),
                    ),
                    wb20,
                    Container(
                      height: 400,
                      width: 300,
                      color: secondaryColor,
                      child: ListView(
                        children: [
                          Container(
                            color: Colors.black,
                            child: ListTile(
                              title: const Text(
                                "Deductions",
                                style: TextStyle(color: secondaryColor),
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    height: 50,
                                    width: 1,
                                    decoration: const BoxDecoration(
                                      color: secondaryColor,
                                      border: Border.symmetric(
                                        vertical: BorderSide(color: secondaryColor),
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 8),
                                    child: Text(
                                      "Amount",
                                      style: TextStyle(color: secondaryColor),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const ListTile(
                            title: Text("Tax/PAYE"),
                            trailing: Text("163,696"),
                          ),
                          const ListTile(
                            title: Text("Employee Pension"),
                            trailing: Text("60,565"),
                          ),
                          const ListTile(
                            title: Text("Total Deduction"),
                            trailing: Text("224,261"),
                          ),
                          ListTile(
                            title: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: primaryColor),
                                ),
                                child: const Text("Net Salary")),
                            trailing: Container(
                              decoration: BoxDecoration(border: Border.all(color: primaryColor)),
                              child: const Text("800,000"),
                            ),
                          ),
                          const Text(
                            "Net Salary in Words: Eight Hundred Thousand Naira Only",
                            style: TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SallaryTile extends StatelessWidget {
  const SallaryTile({
    super.key,
    required this.title,
    required this.value,
  });
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Container(
        width: size.width / 6.5,
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(color: black),
          borderRadius: const BorderRadius.all(Radius.circular(4)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Text(value),
            ],
          ),
        ),
      ),
    );
  }
}
