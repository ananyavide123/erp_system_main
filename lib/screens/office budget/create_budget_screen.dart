import 'package:erp_system/reusables/buttons.dart';
import 'package:erp_system/reusables/tablecalendar.dart';
import 'package:flutter/material.dart';

import '../../reusables/colors.dart';
import '../../reusables/custom_dropdown.dart';
import '../../reusables/custom_text_form_field.dart';
import '../../reusables/sized_box_hw.dart';

class SecondOfficeBudget extends StatefulWidget {
  const SecondOfficeBudget({super.key});

  @override
  State<SecondOfficeBudget> createState() => _SecondOfficeBudgetState();
}

class _SecondOfficeBudgetState extends State<SecondOfficeBudget> {
  List<String> itemNameList = ["Item1", "Item2", "Item3", "Item4"];

  String selectedReceivingList = '';
  List<String> receivingList = ["Finished Product", "Raw Material", "Semifinished Material", "Non-Stock Material" "Team"];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Column(
      children: [
        SingleChildScrollView(
          child: Container(
            color: secondaryColor,
            height: size.height / 2 - 80,
            width: size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 20, left: 20),
                  child: Text(
                    "Create Budget\nKindly fill in the form below to create a budget",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                hb10,
                Row(
                  children: [
                    Container(
                      height: 300,
                      width: 300,
                      color: secondaryColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomTextFormField(
                            title: 'Budget number',
                            hintText: 'Enter item',
                          ),
                          hb10,
                          const TableCalendar(),
                          hb30,
                          CTAButton(
                            action: () {},
                            submitTitle: 'Create Budget',
                          ),
                        ],
                      ),
                    ),
                    wb20,
                    Container(
                      height: 300,
                      width: 300,
                      color: secondaryColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomTextFormField(
                            title: 'Budget description',
                            hintText: 'Enter Discription',
                          ),
                          hb10,
                          CustomDropdownWithTitle(
                            title: 'Receiving office',
                            value: selectedReceivingList,
                            items: receivingList,
                            onChanged: (newValue) {
                              if (newValue != null) {
                                setState(() {
                                  selectedReceivingList = newValue;
                                });
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    wb20,
                    Container(
                      height: 300,
                      width: 300,
                      color: secondaryColor,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextFormField(
                            title: 'Budget amount',
                            hintText: 'Enter amount',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        hb10,
        Container(
          height: 250,
          width: size.width,
          color: secondaryColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Budget Request",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              hb10,
              DataTable(
                columns: const [
                  DataColumn(label: Text('S/N')),
                  DataColumn(label: Text('Budget No.')),
                  DataColumn(label: Text('Budget Description')),
                  DataColumn(label: Text('Budget Amount')),
                  DataColumn(label: Text('Date')),
                ],
                rows: const [
                  DataRow(
                    cells: [
                      DataCell(Text('01')),
                      DataCell(Text('00211235')),
                      DataCell(Text('Purchase of 10 units, 2Hp Hisense Air Conditions')),
                      DataCell(Text('1,400,000,00')),
                      DataCell(Text('18/11/2022')),
                    ],
                  )
                ],
              ),
              hb20,
              Row(
                children: [
                  CTAButton(
                    action: () {},
                    submitTitle: 'submit for Approval',
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
