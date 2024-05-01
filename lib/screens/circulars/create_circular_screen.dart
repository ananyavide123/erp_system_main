import 'package:erp_system/reusables/buttons.dart';
import 'package:flutter/material.dart';

import '../../reusables/colors.dart';
import '../../reusables/custom_dropdown.dart';
import '../../reusables/custom_text_form_field.dart';
import '../../reusables/sized_box_hw.dart';
import '../../reusables/tablecalendar.dart';

class SecondCircularScreen extends StatefulWidget {
  const SecondCircularScreen({Key? key}) : super(key: key);

  @override
  SecondCircularScreenState createState() => SecondCircularScreenState();
}

class SecondCircularScreenState extends State<SecondCircularScreen> {
  List<String> itemNameList = ["Item1", "Item2", "Item3", "Item4"];

  String selectedSendName = '';
  List<String> sendList = ["HR", "Manager", "TL"];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 50.0, left: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: size.height - 150,
            width: size.width - 200,
            color: secondaryColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Create Circular",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                hb30,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomTextFormField(
                      title: 'Circular title',
                      hintText: 'Enter title',
                    ),
                    const CustomTextFormField(
                      title: 'Sent from',
                      hintText: 'Otor John',
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
                  ],
                ),
                wb10,
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Row(
                    children: [
                      const TableCalendar(),
                      wb10,
                      CustomTextFormField(
                        width: size.width - 700,
                        title: 'Circular message',
                        hintText: 'Enter message',
                        maxLines: 3,
                      ),
                    ],
                  ),
                ),
                CTAButton(
                  action: () {},
                  submitTitle: 'Send Circular',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
