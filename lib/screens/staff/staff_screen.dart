import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';

import '../../reusables/buttons.dart';
import '../../reusables/colors.dart';
import '../../reusables/custom_container.dart';
import '../../reusables/custom_dropdown.dart';
import '../../reusables/custom_text_form_field.dart';
import '../../reusables/sized_box_hw.dart';
import '../dashboard/dashboard_card.dart';
import 'add_new_staff.dart';
import 'all_staff_table.dart';

class StaffScreen extends StatefulWidget {
  const StaffScreen({super.key});

  @override
  State<StaffScreen> createState() => _StaffScreenState();
}

class _StaffScreenState extends State<StaffScreen> {
  bool showStaffScreen = false;
  bool showStaffScreenBody = true;

  String selectedStaffList = '';
  List<String> staffList = ["All Staff", "Admin", "I.T.", "P.M.", "None"];

  ///toggle screen
  void toggleStaffScreen() {
    if (showStaffScreen) {
      setState(() {
        showStaffScreenBody = true;
        showStaffScreen = false;
      });
    } else {
      setState(() {
        showStaffScreenBody = false;
        showStaffScreen = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    double tfw = size.width / 5;
    return showStaffScreen
        ? Container(
            color: secondaryColor,
            width: size.width,
            child: Column(
              children: [
                CustomBackButton(action: toggleStaffScreen),
                const AddStaffWidget(),
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
                        title: 'Quick search a staff',
                        hintText: 'Enter search word',
                        suffixIcon: Icons.search,
                      ),
                      const CountCard(
                        count: '250',
                        title: 'Total number of staff',
                      ),
                      CustomDropdownWithTitle(
                        hintText: "All Staff",
                        title: 'Filter staff',
                        width: tfw,
                        value: selectedStaffList,
                        items: staffList,
                        onChanged: (newValue) {
                          if (newValue != null) {
                            setState(() {
                              selectedStaffList = newValue;
                            });
                          }
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: CTAButton(
                          isTopPadding: false,
                          submitTitle: 'Add Staff',
                          action: () {
                            toggleStaffScreen();
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
                    const PageHeader(title: 'All Staff'),
                    SizedBox(
                      height: size.height - 255,
                      child: const AllStaffTable(),
                    ),
                  ],
                ),
              ),
            ],
          );
  }
}

class DataTable2SimpleDemo extends StatelessWidget {
  const DataTable2SimpleDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: DataTable2(
        columnSpacing: 12,
        horizontalMargin: 12,
        minWidth: 600,
        columns: const [
          DataColumn2(
            label: Text('Column A'),
            size: ColumnSize.L,
          ),
          DataColumn(
            label: Text('Column B'),
          ),
          DataColumn(
            label: Text('Column C'),
          ),
          DataColumn(
            label: Text('Column D'),
          ),
          DataColumn(
            label: Text('Column NUMBERS'),
            numeric: true,
          ),
        ],
        rows: List<DataRow>.generate(
          100,
          (index) => DataRow(
            cells: [
              DataCell(Text('A' * (10 - index % 10))),
              DataCell(Text('B' * (10 - (index + 5) % 10))),
              DataCell(Text('C' * (15 - (index + 5) % 10))),
              DataCell(Text('D' * (15 - (index + 10) % 10))),
              DataCell(Text(((index + 0.1) * 25.4).toString()))
            ],
          ),
        ),
      ),
    );
  }
}
