import 'package:erp_system/reusables/buttons.dart';
import 'package:flutter/material.dart';

import '../../reusables/colors.dart';
import '../../reusables/sized_box_hw.dart';

showScheduleMaintenanceDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return const AlertDialog(
        backgroundColor: secondaryColor,
        title: Text(
          "Schedule Maintenance",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        content: ThirdMaintenanceScreen(),
      );
    },
  );
}

class ThirdMaintenanceScreen extends StatelessWidget {
  const ThirdMaintenanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SizedBox(
      width: size.width / 2,
      child: Column(
        children: [
          SizedBox(
            height: 300,
            width: size.width - 50,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Schedule Maintenance",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Item name\n2Hp Hisense Air Condition"),
                        Text("Number\n3"),
                        Text("Date\n18/11/2022"),
                        Text("Maintenance type\nRecurring"),
                        Text("Recurring type\nEvery two months"),
                        Text("Status\nCompleted"),
                      ],
                    ),
                  ),
                  hb40,
                  Row(
                    children: [
                      CTAButton(
                        action: () {},
                        submitTitle: "Attach Payment Invoice",
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 450,
            width: size.width - 50,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Maintenance Breakdown",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 80),
                        child: Text(
                          "To Be Designed",
                          style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '😀',
                        style: TextStyle(fontSize: 60),
                      ),
                    ],
                  ),
                  hb40,
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Row(
                      children: [
                        CTAButton(
                          action: () {},
                          submitTitle: 'Submit',
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
