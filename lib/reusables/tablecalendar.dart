import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'custom_text_form_field.dart';

class TableCalendar extends StatefulWidget {
  const TableCalendar({
    super.key,
  });

  @override
  State<TableCalendar> createState() => _TableCalendarState();
}

class _TableCalendarState extends State<TableCalendar> {
  DateTime selectedDate = DateTime.now();

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomTextFormField(
          readOnly: true,
          title: 'Date',
          hintText: DateFormat('dd-MM-yyyy').format(selectedDate.toLocal()),
          action: () {
            selectDate(context);
          },
          suffixIcon: Icons.calendar_month,
        ),
      ],
    );
  }
}
