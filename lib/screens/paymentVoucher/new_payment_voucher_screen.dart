import 'package:erp_system/reusables/buttons.dart';
import 'package:erp_system/screens/paymentVoucher/create_memo.dart';
import 'package:flutter/material.dart';

import '../../reusables/colors.dart';
import '../../reusables/custom_text_form_field.dart';
import '../../reusables/sized_box_hw.dart';

class NewPaymentScreen extends StatefulWidget {
  const NewPaymentScreen({super.key});

  @override
  State<NewPaymentScreen> createState() => _NewPaymentScreenState();
}

class _NewPaymentScreenState extends State<NewPaymentScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      height: size.height -100,
      width: 1000,
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0, left: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Payment Voucher",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              hb10,
              const Text("Subject"),
              const Padding(
                padding: EdgeInsets.only(right: 300.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter subject',
                  ),
                ),
              ),
              hb10,
              DataTable(
                columns: const [
                  DataColumn(
                    label: Text('Col1'),
                  ),
                  DataColumn(
                    label: Text('Col2'),
                  ),
                  DataColumn(
                    label: Text('Col2'),
                  ),
                  DataColumn(
                    label: Text('Col2'),
                  ),
                  DataColumn(
                    label: Text('Col2'),
                  ),
                  DataColumn(
                    label: Text('Col2'),
                  ),
                  DataColumn(
                    label: Text('Col2'),
                  ),
                  DataColumn(
                    label: Text('Col2'),
                  ),
                  DataColumn(
                    label: Text('Col2'),
                  ),
                ],
                rows: const [
                  DataRow(
                    cells: [
                      DataCell(Text('ValCol1')),
                      DataCell(Text('ValCol2')),
                      DataCell(Text('ValCol2')),
                      DataCell(Text('ValCol2')),
                      DataCell(Text('ValCol2')),
                      DataCell(Text('ValCol2')),
                      DataCell(Text('ValCol2')),
                      DataCell(Text('ValCol2')),
                      DataCell(Text('ValCol2')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text("2")),
                      DataCell(Text("John")),
                      DataCell(Text("Anderson")),
                      DataCell(Text("24")),
                      DataCell(Text("24")),
                      DataCell(Text("24")),
                      DataCell(Text("24")),
                      DataCell(Text("24")),
                      DataCell(Text("24")),
                    ],
                  ),
                ],
              ),
              CTAButton(
                action: () {},
                submitTitle: 'Add New Row',
              ),
              const SizedBox(height: 5),
              DataTable(
                columns: const [
                  DataColumn(
                    label: Text('Col1'),
                  ),
                  DataColumn(
                    label: Text('Col2'),
                  ),
                  DataColumn(
                    label: Text('Col2'),
                  ),
                  DataColumn(
                    label: Text('Col2'),
                  ),
                  DataColumn(
                    label: Text('Col2'),
                  ),
                  DataColumn(
                    label: Text('Col2'),
                  ),
                  DataColumn(
                    label: Text('Col2'),
                  ),
                ],
                rows: const [
                  DataRow(
                    cells: [
                      DataCell(Text('')),
                      DataCell(Text('')),
                      DataCell(Text('')),
                      DataCell(Text('')),
                      DataCell(Text('')),
                      DataCell(Text('')),
                      DataCell(Text('')),
                    ],
                  ),
                ],
              ),
              hb10,
              const Text("Net amount in words:_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _"),
              const SizedBox(height: 15),
              const Text(
                "Beneficiary Payment Details",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 23),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 30.0),
                    child: CustomTextFormField(
                      hintText: 'Enter name',
                      title: 'Account name',
                    ),
                  ),
                  wb20,
                  const CustomTextFormField(
                    hintText: 'Enter number',
                    title: 'Account number',
                  ),
                  wb20,
                  const CustomTextFormField(
                    hintText: 'Enter bank name',
                    title: 'Account name',
                  ),
                ],
              ),
              hb20,
              CTAButton(
                action: () {
                  createMemoDialog(context);
                },
                submitTitle: 'Submit Payment Voucher',
              )
            ],
          ),
        ),
      ),
    );
  }
}
