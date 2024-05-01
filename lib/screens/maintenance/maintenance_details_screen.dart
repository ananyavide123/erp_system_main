import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../reusables/colors.dart';
import '../../reusables/sized_box_hw.dart';

class MaintenanceDetailsScreen extends StatefulWidget {
  const MaintenanceDetailsScreen({super.key});

  @override
  State<MaintenanceDetailsScreen> createState() => _MaintenanceDetailsScreenState();
}

class _MaintenanceDetailsScreenState extends State<MaintenanceDetailsScreen> {
  late final dynamic locale;
  DateTime today = DateTime.now();

  void onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
      height: size.height - 325,
      width: size.width,
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              width: 400,
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(.15),
                borderRadius: BorderRadius.circular(20),
              ),
              child: TableCalendar(
                onDaySelected: onDaySelected,
                rowHeight: 40,
                availableGestures: AvailableGestures.all,
                headerStyle: const HeaderStyle(formatButtonVisible: false, titleCentered: true),
                focusedDay: today,
                selectedDayPredicate: (day) => isSameDay(day, today),
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 50),
            child: Container(
              width: 1,
              decoration: BoxDecoration(
                color: Colors.black26,
                border: Border.symmetric(
                  vertical: BorderSide(color: grey.withOpacity(0.2)),
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("18th November,2022\n1.Scheduled maintenance for service of 3 unit of AC"),
              OutlinedButton(
                onPressed: () {},
                child: const Text("View"),
              ),
              hb40,
              const Text("18th November,2022\n1.Scheduled maintenance for service of 3 unit of AC"),
              OutlinedButton(
                onPressed: () {},
                child: const Text("View"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
