import 'package:erp_system/reusables/buttons.dart';
import 'package:flutter/material.dart';

import '../../reusables/colors.dart';
import '../../reusables/custom_dropdown.dart';
import '../../reusables/custom_rich_text.dart';
import '../../reusables/custom_text_form_field.dart';
import '../../reusables/sized_box_hw.dart';

showLogisticScreenDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return const AlertDialog(
        backgroundColor: secondaryColor,
        title: Text(
          "Schedule Maintenance",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        content: ThirdLogisticScreen(),
      );
    },
  );
}

class ThirdLogisticScreen extends StatefulWidget {
  const ThirdLogisticScreen({super.key});

  @override
  State<ThirdLogisticScreen> createState() => _ThirdLogisticScreenState();
}

class _ThirdLogisticScreenState extends State<ThirdLogisticScreen> {
  List<String> itemNameList = ["Item1", "Item2", "Item3", "Item4"];

  String selectedActionList = '';
  List<String> actionList = ["", "", ""];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SizedBox(
      width: size.width / 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Request For Travel Time",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: black,
            ),
          ),
          const CustomRichText(
            title: 'Purpose:',
            value: 'Training course',
          ),
          const CustomRichText(
            title: 'Amount:',
            value: '360,000.00',
          ),
          const CustomRichText(
            title: 'From:',
            value: 'Otor John Stephen',
          ),
          const CustomRichText(
            title: 'To:',
            value: 'Fatimah Mohammed',
          ),
          const CustomRichText(
            title: 'Duration:',
            value: '4 days - (21/12/2022 - 24/12/2022)',
          ),
          const CustomRichText(
            title: 'Status:',
            value: 'Pending',
          ),
          const CustomRichText(
            title: 'Attachment:',
            value: 'Yes',
          ),
          hb40,
          const Divider(thickness: 1, color: grey),
          hb80,
          hb40,
          const Divider(thickness: 1, color: primaryColor),
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
    );
  }
}
