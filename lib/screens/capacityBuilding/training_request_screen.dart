import 'package:erp_system/reusables/buttons.dart';
import 'package:flutter/material.dart';

import '../../reusables/colors.dart';
import '../../reusables/custom_dropdown.dart';
import '../../reusables/custom_text_form_field.dart';
import '../../reusables/sized_box_hw.dart';
import '../../reusables/tablecalendar.dart';
import 'staff_health_screen.dart';

class SecondCapacityBuilding extends StatefulWidget {
  const SecondCapacityBuilding({super.key});

  @override
  State<SecondCapacityBuilding> createState() => _SecondCapacityBuildingState();
}

class _SecondCapacityBuildingState extends State<SecondCapacityBuilding> {
  List<String> itemNameList = [
    "Item1",
    "Item2",
    "Item3",
    "Item4",
  ];

  String selectedTrainingtypeName = '';
  List<String> trainingtypeList = [
    "Industrial Training",
    "Software Training",
    "Web Designing",
    "Other",
  ];

  String selectedTrainingdurationName = '';
  List<String> trainingdurationList = [
    "Summer Training",
    "Winter Training",
  ];

  String selectedNameList = '';
  List<String> nameList = [
    "X",
    "Y",
    "Z",
    "J",
  ];

  String selectedModeList = '';
  List<String> modeList = [
    "Online",
    "Offline",
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Container(
            color: secondaryColor,
            height: 500,
            width: size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 20, left: 20),
                  child: Text(
                    " Training Request",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                hb10,
                hb10,
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Container(
                        height: 200,
                        width: 300,
                        color: secondaryColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CustomTextFormField(
                              title: 'Training description',
                              hintText: 'Enter description',
                            ),
                            hb10,
                            const TableCalendar(),
                          ],
                        ),
                      ),
                      wb20,
                      Container(
                        height: 200,
                        width: 300,
                        color: secondaryColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomDropdownWithTitle(
                              hintText: 'Select type',
                              title: 'Training type',
                              value: selectedTrainingtypeName,
                              items: trainingtypeList,
                              onChanged: (newValue) {
                                if (newValue != null) {
                                  setState(() {
                                    selectedTrainingtypeName = newValue;
                                  });
                                }
                              },
                            ),
                            hb10,
                            CustomDropdownWithTitle(
                              hintText: 'Select mode',
                              title: 'Training mode',
                              value: selectedModeList,
                              items: modeList,
                              onChanged: (newValue) {
                                if (newValue != null) {
                                  setState(() {
                                    selectedModeList = newValue;
                                  });
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                      wb20,
                      Container(
                        height: 200,
                        width: 300,
                        color: secondaryColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomDropdownWithTitle(
                              title: 'Training Duration',
                              value: selectedTrainingdurationName,
                              items: trainingdurationList,
                              onChanged: (newValue) {
                                if (newValue != null) {
                                  setState(() {
                                    selectedTrainingdurationName = newValue;
                                  });
                                }
                              },
                            ),
                            hb10,
                            CustomDropdownWithTitle(
                              hintText: 'Select names',
                              title: 'Staff to be trained',
                              value: selectedNameList,
                              items: nameList,
                              onChanged: (newValue) {
                                if (newValue != null) {
                                  setState(() {
                                    selectedNameList = newValue;
                                  });
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                hb10,
                hb40,
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      CTAButton(
                        action: () {
                          showCapacityBuildingDialog(context);
                        },
                        submitTitle: "Save and Submit",
                      ),
                      wb10,
                      CTAButton(
                        action: () {},
                        submitTitle: "Save",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
