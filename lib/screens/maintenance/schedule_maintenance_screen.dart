import 'package:flutter/material.dart';

import '../../reusables/buttons.dart';
import '../../reusables/colors.dart';
import '../../reusables/custom_dropdown.dart';
import '../../reusables/sized_box_hw.dart';
import '../../reusables/tablecalendar.dart';
import 'maintenance_breakdown_screen.dart';

class SecondMaintenanceScreen extends StatefulWidget {
  const SecondMaintenanceScreen({super.key});

  @override
  State<SecondMaintenanceScreen> createState() => _SecondMaintenanceScreenState();
}

class _SecondMaintenanceScreenState extends State<SecondMaintenanceScreen> {
  List<String> itemNameList = ["Item1", "Item2", "Item3", "Item4"];

  String selectedItemName = '';
  List<String> maintenancetypeList = ["Type1", "Type2", "Type3", "Type4"];

  String selectedMaintenancetypeList = '';
  List<String> maintenanceList = ["Activity", "Client Rating", "Job Status", "Team"];

  String selectedNumber = '';
  List<String> numberList = ["1", "2", "3", "4"];

  String selectedRecurringList = '';
  List<String> recurringList = ["Repeat", "Auto Repeat"];
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
                "Schedule Maintenance",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            hb40,
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
                      ///
                      CustomDropdownWithTitle(
                        hintText: 'Select item',
                        title: 'Item name',
                        value: selectedItemName,
                        items: itemNameList,
                        onChanged: (newValue) {
                          if (newValue != null) {
                            setState(() {
                              selectedItemName = newValue;
                            });
                          }
                        },
                      ),
                      hb20,

                      CustomDropdownWithTitle(
                        title: 'Maintenance type',
                        value: selectedMaintenancetypeList,
                        items: maintenanceList,
                        onChanged: (newValue) {
                          if (newValue != null) {
                            setState(() {
                              selectedMaintenancetypeList = newValue;
                            });
                          }
                        },
                      ),

                      ///cta button
                      CTAButton(
                        submitTitle: 'Schedule Maintenance',
                        action: () {
                          showScheduleMaintenanceDialog(context);
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 400,
                  width: 300,
                  color: secondaryColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomDropdownWithTitle(
                        title: 'Number ',
                        value: selectedNumber,
                        items: numberList,
                        onChanged: (newValue) {
                          if (newValue != null) {
                            setState(() {
                              selectedNumber = newValue;
                            });
                          }
                        },
                      ),
                      hb20,
                      CustomDropdownWithTitle(
                        title: 'Recurring option',
                        value: selectedRecurringList,
                        items: recurringList,
                        onChanged: (newValue) {
                          if (newValue != null) {
                            setState(() {
                              selectedRecurringList = newValue;
                            });
                          }
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 400,
                  width: 300,
                  color: secondaryColor,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TableCalendar(),
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
