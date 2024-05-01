import 'package:flutter/material.dart';

import '../../reusables/buttons.dart';
import '../../reusables/colors.dart';
import '../../reusables/custom_container.dart';
import '../../reusables/custom_dropdown.dart';
import '../../reusables/custom_text_form_field.dart';
import '../../reusables/sized_box_hw.dart';
import '../dashboard/dashboard_card.dart';
import 'circular_table.dart';
import 'create_circular_screen.dart';

class CircularScreen extends StatefulWidget {
  const CircularScreen({super.key});

  @override
  State<CircularScreen> createState() => _CircularScreenState();
}

class _CircularScreenState extends State<CircularScreen> {
  bool showCircularScreen = false;
  bool showCircularScreenBody = true;

  String selectedCircular = '';
  List<String> circularList = ["All Circular", "Admin, HR"];

  ///toggle screen
  void toggleCircularScreen() {
    if (showCircularScreen) {
      setState(() {
        showCircularScreenBody = true;
        showCircularScreen = false;
      });
    } else {
      setState(() {
        showCircularScreenBody = false;
        showCircularScreen = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    double tfw = size.width / 5;
    return showCircularScreen
        ? Container(
            color: secondaryColor,
            width: size.width,
            child: Column(
              children: [
                CustomBackButton(action: toggleCircularScreen),
                const SecondCircularScreen(),
              ],
            ),
          )
        :

        ///all staff body
        Column(
            children: [
              CustomContainer(
                height: 130,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextFormField(
                        width: tfw,
                        title: 'Quick search a circular',
                        hintText: 'Enter search word',
                        suffixIcon: Icons.search,
                      ),
                      const CountCard(
                        count: '30',
                        title: 'Total Circular',
                      ),
                      CustomDropdownWithTitle(
                        hintText: "All circulars",
                        title: 'Filter circular',
                        width: tfw,
                        value: selectedCircular,
                        items: circularList,
                        onChanged: (newValue) {
                          if (newValue != null) {
                            setState(() {
                              selectedCircular = newValue;
                            });
                          }
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: CTAButton(
                          isTopPadding: false,
                          submitTitle: 'Create Circular',
                          action: () {
                            toggleCircularScreen();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              hb10,
              CustomContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const PageHeader(title: 'All Circulars'),
                    SizedBox(
                      height: size.height - 255,
                      child: const CircularTable(),
                    ),
                  ],
                ),
              ),
            ],
          );
  }
}
