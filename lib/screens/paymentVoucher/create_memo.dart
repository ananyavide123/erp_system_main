import 'package:erp_system/reusables/buttons.dart';
import 'package:flutter/material.dart';

import '../../reusables/colors.dart';
import '../../reusables/custom_dropdown.dart';
import '../../reusables/custom_text_form_field.dart';
import '../../reusables/sized_box_hw.dart';
import '../../reusables/tablecalendar.dart';

Future<void> createMemoDialog(BuildContext context) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext ctxt) {
      return AlertDialog(
        backgroundColor: secondaryColor,
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
        content: const CreateMemo(),
      );
    },
  );
}

class CreateMemo extends StatefulWidget {
  const CreateMemo({super.key});

  @override
  State<CreateMemo> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CreateMemo> {
  List<String> itemNameList = ["Item1", "Item2", "Item3", "Item4"];

  String selectedSendName = '';
  List<String> sendList = ["HR", "TL", "Manager"];

  String selectedMaintenancetypeList = '';
  List<String> numberList = ["Option1", "Option2", "Option3", "Option4"];
  final GlobalKey<FormState> createMemoFormKey = GlobalKey<FormState>();
  double tfw = 310;
  double spacing = 20;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (tfw + spacing) * 2,
      height: (tfw + spacing) * 2,
      child: SingleChildScrollView(
        child: Form(
          key: createMemoFormKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Wrap(
            runSpacing: spacing,
            spacing: spacing,
            children: [
              CustomTextFormField(
                width: tfw,
                hintText: 'Enter title',
                title: 'Memo title',
              ),
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
              CustomDropdownWithTitle(
                title: 'CC1',
                value: selectedMaintenancetypeList,
                items: numberList,
                onChanged: (newValue) {
                  if (newValue != null) {
                    setState(() {
                      selectedMaintenancetypeList = newValue;
                    });
                  }
                },
              ),
              CustomDropdownWithTitle(
                title: 'Cc 1 action',
                value: selectedMaintenancetypeList,
                items: numberList,
                onChanged: (newValue) {
                  if (newValue != null) {
                    setState(() {
                      selectedMaintenancetypeList = newValue;
                    });
                  }
                },
              ),
              Container(
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                  border: Border.all(color: Colors.grey),
                ),
                width: 50,
                height: 50,
                child: const Icon(Icons.add),
              ),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 30.0),
                    child: TableCalendar(),
                  ),
                ],
              ),
              hb30,
              CustomTextFormField(
                hintText: 'Enter title',
                width: tfw,
                maxLines: 3,
                title: 'Memo body',
              ),
              hb30,
              const Padding(
                padding: EdgeInsets.only(left: 30.0),
                child: Text(
                  "Attachement",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 30.0),
                    child: Icon(Icons.description),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text("REQUEST FOR FARS FOR OCTOBER 2022 IFO GRM CONSULTING LTD"),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: CTAButton(
                  action: () {},
                  submitTitle: "Submit Payment Voucher",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
