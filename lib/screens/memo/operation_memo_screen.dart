import 'package:erp_system/reusables/buttons.dart';
import 'package:erp_system/reusables/custom_dropdown.dart';
import 'package:erp_system/reusables/custom_text_form_field.dart';
import 'package:flutter/material.dart';

import '../../reusables/colors.dart';
import '../../reusables/custom_rich_text.dart';

import '../../reusables/sized_box_hw.dart';

showMemoScreenDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return const AlertDialog(
        backgroundColor: secondaryColor,
        title: Text(
          "Schedule Maintenance",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        content: ThirdMemoScreen(),
      );
    },
  );
}

class ThirdMemoScreen extends StatefulWidget {
  const ThirdMemoScreen({super.key});

  @override
  State<ThirdMemoScreen> createState() => _ThirdMemoScreenState();
}

class _ThirdMemoScreenState extends State<ThirdMemoScreen> {
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Operations Memo",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const CustomRichText(
          title: ' Date:',
          value: '21/12/2022',
        ),
        const CustomRichText(
          title: 'From',
          value: 'Otor John Stephen',
        ),
        const CustomRichText(
          title: 'To',
          value: 'Abubakr Algazali ',
        ),
        const CustomRichText(
          title: 'CC1:',
          value: 'Fatimah Mohammed ',
        ),
        const CustomRichText(
          title: 'CC2:',
          value: 'Sadiq Lukman ',
        ),
        const CustomRichText(
          title: 'CC3:',
          value: 'Jemz Nweke Jnr. ',
        ),
        const CustomRichText(
          title: 'Attachment:',
          value: 'No ',
        ),
        const CustomRichText(
          title: 'Memo Message:',
          value:
              'Lorem ipsum dolor sit amet consectetur. Purus lacinia pulvinar morbi praesent egestas senectus non neque sem.\nFermentum mi ipsum dictumst ultricies mollis.Amet prasent convallis vivamus rhoncus Volupat sit aliquet elementum facilis\nconsectetur.Amet rhoncus varius iaculis et integer. In eu praesent consequat marnis erat penatibus a.Eu nulla cursus sagittis at\ngravida a proin sit augue.Massa integer ut interdum orci porta duis diam id pellentesque.Sem viverra iaculis quisque etiam phasellus\nnullam vestibulul gravida.',
        ),
        hb80,
        const Divider(thickness: 1, color: grey),
        hb80,
        hb40,
        const Divider(thickness: 1, color: primaryColor),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomDropdownWithTitle(
              fillColor: backgroundColor,
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
            const CustomTextFormField(title: 'Remarks', hintText: 'Enter remark'),
            CTAButton(
              action: () {},
              submitTitle: 'Submit',
            ),
          ],
        ),
      ],
    );
  }
}
