import 'package:erp_system/reusables/buttons.dart';
import 'package:flutter/material.dart';

import '../../reusables/custom_dropdown.dart';
import '../../reusables/custom_text_form_field.dart';
import '../../reusables/sized_box_hw.dart';
import '../../reusables/tablecalendar.dart';
import 'logistic_traveltime_screen.dart';

class SecondLogisticScreen extends StatefulWidget {
  const SecondLogisticScreen({super.key});

  @override
  State<SecondLogisticScreen> createState() => _SecondLogisticScreenState();
}

class _SecondLogisticScreenState extends State<SecondLogisticScreen> {
  List<String> itemNameList = ["Item1", "Item2", "Item3", "Item4"];

  String selectedSendName = '';
  List<String> sendList = ["HR", "TL", "Manager"];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "Logistic Request\nKindly fill in the form below to submit a logistics request",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          hb10,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomTextFormField(
                    title: 'Request',
                    hintText: 'Enter title',
                  ),
                  hb10,
                  const CustomTextFormField(
                    title: 'Requested by',
                    hintText: 'Otor john Stephen',
                  ),
                  hb10,
                  const TableCalendar(),
                  hb10,
                  CTAButton(
                    action: () {
                      showLogisticScreenDialog(context);
                    },
                    submitTitle: 'Attach Payment Voucher',
                  ),
                ],
              ),
              wb20,
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomTextFormField(
                    title: 'Purpose',
                    hintText: 'Enter purpose',
                  ),
                  hb10,
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
              wb20,
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomTextFormField(
                    title: 'Amount',
                    hintText: 'Enter amount',
                  ),
                  hb10,
                  const TableCalendar(),
                ],
              ),
            ],
          ),
          hb10,
          const Text("Payment Voucher"),
          hb10,
          DataTable(
            columns: const [
              DataColumn(label: Text('S/N')),
              DataColumn(label: Text('Request Title')),
              DataColumn(label: Text('Purpose')),
              DataColumn(label: Text('Date from')),
              DataColumn(label: Text('Date To')),
              DataColumn(label: Text('Amount')),
            ],
            rows: const [
              DataRow(
                cells: [
                  DataCell(Text('01')),
                  DataCell(Text('Request for travel time')),
                  DataCell(Text(' Training course')),
                  DataCell(Text('22/11/2022')),
                  DataCell(Text('30/11/2022')),
                  DataCell(Text('360,000.00')),
                ],
              )
            ],
          ),
          hb10,
          const Text("Beneficialy Payment Details "),
          hb10,
          Row(
            children: [
              const CustomTextFormField(
                title: 'Account name',
                hintText: 'Enter name',
              ),
              wb10,
              const CustomTextFormField(
                title: 'Account number',
                hintText: 'Enter number',
              ),
              wb10,
              const CustomTextFormField(
                title: 'Bank name',
                hintText: 'Enter bank name',
              ),
            ],
          ),
          hb20,
          hb30,
          Row(
            children: [
              const Text("Verifire Signature"),
              wb60,
              const Text("Authorezer Signature"),
            ],
          ),
          hb40,
          Row(
            children: [
              CTAButton(
                width: 230,
                action: () {},
                submitTitle: 'Save and send for Approval',
              ),
              wb10,
              CTAButton(
                action: () {},
                submitTitle: 'Save ',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
