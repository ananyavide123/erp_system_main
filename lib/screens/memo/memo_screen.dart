import 'package:flutter/material.dart';

import '../../reusables/buttons.dart';
import '../../reusables/colors.dart';
import '../../reusables/custom_container.dart';
import '../../reusables/custom_dropdown.dart';
import '../../reusables/custom_text_form_field.dart';
import '../../reusables/sized_box_hw.dart';
import '../dashboard/dashboard_card.dart';
import 'create_memo_screen.dart';
import 'memo_table.dart';

class MemoScreen extends StatefulWidget {
  const MemoScreen({super.key});

  @override
  State<MemoScreen> createState() => _MemoScreenState();
}

class _MemoScreenState extends State<MemoScreen> {
  bool showMemoScreen = false;
  bool showMemoScreenBody = true;

  String selectedMemo = '';
  List<String> memoList = ["All Memos", "Operations Memo"];

  ///toggle screen
  void toggleMemoScreen() {
    if (showMemoScreen) {
      setState(() {
        showMemoScreenBody = true;
        showMemoScreen = false;
      });
    } else {
      setState(() {
        showMemoScreenBody = false;
        showMemoScreen = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    double tfw = size.width / 5;
    return showMemoScreen
        ? Container(
            color: secondaryColor,
            width: size.width,
            child: Column(
              children: [
                CustomBackButton(action: toggleMemoScreen),
                const SecondMemoScreen(),
              ],
            ),
          )
        :

        ///all Memo body
        Column(
            children: [
              CustomContainer(
                height: 130,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CountCard(
                        count: '300',
                        title: 'Total Memo',
                      ),
                      CustomTextFormField(
                        width: tfw,
                        title: 'Quick search a memo',
                        hintText: 'Enter search word',
                        suffixIcon: Icons.search,
                      ),
                      CustomDropdownWithTitle(
                        hintText: "All memos",
                        title: 'Filter memo',
                        width: tfw,
                        value: selectedMemo,
                        items: memoList,
                        onChanged: (newValue) {
                          if (newValue != null) {
                            setState(() {
                              selectedMemo = newValue;
                            });
                          }
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: CTAButton(
                          isTopPadding: false,
                          submitTitle: 'Create Memo',
                          action: () {
                            toggleMemoScreen();
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
                    const PageHeader(title: 'All Memos'),
                    SizedBox(
                      height: size.height - 255,
                      child: const MemoScreenTable(),
                    ),
                  ],
                ),
              ),
            ],
          );
  }
}
