import 'package:erp_system/reusables/buttons.dart';
import 'package:flutter/material.dart';

import '../../reusables/colors.dart';
import '../../reusables/custom_dropdown.dart';
import '../../reusables/sized_box_hw.dart';

showCapacityBuildingDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return const AlertDialog(
        backgroundColor: secondaryColor,
        title: Text(
          "Schedule Maintenance",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        content: ThirdCapacityBuilding(),
      );
    },
  );
}

class ThirdCapacityBuilding extends StatefulWidget {
  const ThirdCapacityBuilding({super.key});

  @override
  State<ThirdCapacityBuilding> createState() => _ThirdCapacityBuildingState();
}

class _ThirdCapacityBuildingState extends State<ThirdCapacityBuilding> {
  String selectedItemName = '';
  List<String> maintenancetypeList = ["Type1", "Type2", "Type3", "Type4"];

  String selectedUpdateList = '';
  List<String> updateList = [
    "Yes",
    "No",
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      width: 700,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Staff Health and Safety Training",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          hb20,
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Training type\nTeam training"),
              Text("Training duration\n3weeks"),
              Text("Training mode\nPhysical"),
              Text("Training status\nInprogress"),
            ],
          ),
          hb20,
          const Text(
            "Training participant",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const Text("1.Fatima Mohammed"),
          const Text("2.Ibrahim Bankole"),
          const Text("3.Otor John Stephen"),
          const Text("4.Abubakar Alghazali"),
          const Text("5.Ranky Akab"),
          const Text("6.Sadiq Lukman"),
          hb30,
          Row(
            children: [
              CustomDropdownWithTitle(
                title: 'Update status',
                value: selectedUpdateList,
                items: updateList,
                onChanged: (newValue) {
                  if (newValue != null) {
                    setState(() {
                      selectedUpdateList = newValue;
                    });
                  }
                },
              ),
              wb20,
              CTAButton(
                action: () {},
                submitTitle: 'Update',
              ),
            ],
          )
        ],
      ),
    );
  }
}
