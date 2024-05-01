import 'package:erp_system/reusables/tablecalendar.dart';
import 'package:flutter/material.dart';

import '../../reusables/buttons.dart';
import '../../reusables/colors.dart';
import '../../reusables/custom_dropdown.dart';
import '../../reusables/custom_text_form_field.dart';
import '../../reusables/sized_box_hw.dart';
import 'operation_memo_screen.dart';

class SecondMemoScreen extends StatefulWidget {
  const SecondMemoScreen({super.key});

  @override
  State<SecondMemoScreen> createState() => _SecondMemoScreenState();
}

class _SecondMemoScreenState extends State<SecondMemoScreen> {
  List<String> itemNameList = [
    "Item1",
    "Item2",
    "Item3",
    "Item4",
  ];

  String selectedSendName = '';
  List<String> sendList = [
    "HR",
    "Manager",
    "TL",
  ];

  String selectedAddattachementName = '';
  List<String> addattachementList = [
    "Yes",
    "No",
  ];

  String selectedAttachementtypeList = '';
  List<String> attachementList = [
    "jpg",
    "png",
    ".jpeg",
    "docx",
    "zip",
  ];
  String selectedActionList = '';
  List<String> actionList = [
    "Delete",
    "Dupllicate",
    "View Change Log",
    "Find Dupllicate",
    "Print as PDF",
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    double tfw = 400;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: secondaryColor,
      ),
      height: size.height - 120,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Create Memo",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                hb20,
                const CustomTextFormField(
                  hintText: 'Enter title',
                  title: 'Memo title',
                ),
                wb10,
                const CustomTextFormField(
                  hintText: 'Otor John',
                  title: 'Sent from',
                ),
                wb10,
                CustomDropdownWithTitle(
                  title: 'Send to',
                  value: selectedSendName,
                  items: sendList,
                  onChanged: (newValue) {
                    if (newValue != null) {
                      setState(() {
                        selectedSendName = newValue;
                      });
                    }
                  },
                ),
              ],
            ),
            hb10,
            Row(
              children: [
                CustomDropdownWithTitle(
                  title: 'Action',
                  value: selectedActionList,
                  items: actionList,
                  onChanged: (newValue) {
                    if (newValue != null) {
                      setState(() {
                        selectedActionList = newValue;
                      });
                    }
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  const TableCalendar(),
                  wb10,
                  CustomDropdownWithTitle(
                    title: 'Add attachement?',
                    value: selectedAddattachementName,
                    items: addattachementList,
                    onChanged: (newValue) {
                      if (newValue != null) {
                        setState(() {
                          selectedAddattachementName = newValue;
                        });
                      }
                    },
                  ),
                  wb10,
                  CustomDropdownWithTitle(
                    title: ' Attachement type',
                    value: selectedAttachementtypeList,
                    items: attachementList,
                    onChanged: (newValue) {
                      if (newValue != null) {
                        setState(() {
                          selectedAttachementtypeList = newValue;
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
            hb20,
            Row(
              children: [
                CustomTextFormField(
                  width: tfw,
                  hintText: 'Enter subject',
                  title: 'Memo Body',
                  maxLines: 3,
                ),
              ],
            ),
            hb80,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CTAButton(
                  action: () {
                    showMemoScreenDialog(context);
                  },
                  submitTitle: "Attach Payment Voucher",
                ),
                wb10,
                CTAButton(
                  action: () {},
                  submitTitle: "Send Memo",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
