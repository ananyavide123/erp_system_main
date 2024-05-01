import 'package:erp_system/reusables/buttons.dart';
import 'package:erp_system/reusables/custom_text_form_field.dart';
import 'package:flutter/material.dart';

import '../../reusables/colors.dart';
import '../../reusables/custom_dropdown.dart';
import '../../reusables/custom_rich_text.dart';
import '../../reusables/sized_box_hw.dart';

showProcurementDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return const AlertDialog(
        backgroundColor: secondaryColor,
        title: Text(
          "Schedule Maintenance",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        content: ThirdProcurementScreen(),
      );
    },
  );
}

class ThirdProcurementScreen extends StatefulWidget {
  const ThirdProcurementScreen({super.key});

  @override
  State<ThirdProcurementScreen> createState() => _ThirdProcurementScreenState();
}

class _ThirdProcurementScreenState extends State<ThirdProcurementScreen> {
  List<String> itemNameList = [
    "Item1",
    "Item2",
    "Item3",
    "Item4",
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
    return SizedBox(
      height: size.height,
      width: size.width / 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Procurement Request Detail",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: black,
              ),
            ),
            const CustomRichText(
              title: 'Item:',
              value: 'Office Chairs',
            ),
            const CustomRichText(
              title: 'Quqntity:',
              value: '10',
            ),
            const CustomRichText(
              title: 'Unit Price:',
              value: '360.000.00',
            ),
            const CustomRichText(
              title: 'Total Price:',
              value: '360.000.00',
            ),
            const CustomRichText(
              title: 'Date:',
              value: '21/12/2022',
            ),
            const CustomRichText(
              title: 'Requested By:',
              value: 'Otor John Stephen',
            ),
            const CustomRichText(
              title: 'Sent To:',
              value: 'Fatima Mohammed',
            ),
            const CustomRichText(
              title: 'Request Status:',
              value: 'Pending',
            ),
            const CustomRichText(
              title: 'Attachment:',
              value: 'Yes',
            ),
            hb40,
            const Divider(thickness: 1, color: grey),
            hb40,
            hb40,
            const Divider(thickness: 1, color: primaryColor),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomRichText(
                  title: 'Action:',
                  value: 'Recommended for approval',
                ),
                CustomRichText(
                  title: 'By:',
                  value: 'Fatima Mohammed',
                ),
                CustomRichText(
                  title: 'Signature:',
                  value: '',
                ),
              ],
            ),
            hb40,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                const CustomTextFormField(
                  title: 'Remarks',
                  hintText: 'Enter remark',
                ),
                CTAButton(
                  action: () {},
                  submitTitle: 'submit',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
