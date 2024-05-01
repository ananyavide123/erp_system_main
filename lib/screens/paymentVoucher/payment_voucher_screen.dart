import 'package:flutter/material.dart';

import '../../reusables/buttons.dart';
import '../../reusables/colors.dart';
import '../../reusables/custom_container.dart';
import '../../reusables/custom_dropdown.dart';
import '../../reusables/custom_text_form_field.dart';
import '../../reusables/sized_box_hw.dart';
import '../dashboard/dashboard_card.dart';
import '../staff/all_staff_table.dart';
import 'new_payment_voucher_screen.dart';

class PaymentVoucherScreen extends StatefulWidget {
  const PaymentVoucherScreen({super.key});

  @override
  State<PaymentVoucherScreen> createState() => _PaymentVoucherScreenState();
}

class _PaymentVoucherScreenState extends State<PaymentVoucherScreen> {
  bool showPaymentVoucherScreen = false;
  bool showPaymentVoucherScreenBody = true;

  String selectedPaymentVoucher = '';
  List<String> paymentVoucherList = ["Credit In", "Credit Out", "Deposit", "Withdrawal"];

  ///toggle screen
  void togglePaymentVoucherScreen() {
    if (showPaymentVoucherScreen) {
      setState(() {
        showPaymentVoucherScreenBody = true;
        showPaymentVoucherScreen = false;
      });
    } else {
      setState(() {
        showPaymentVoucherScreenBody = false;
        showPaymentVoucherScreen = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    double tfw = size.width / 5;
    return showPaymentVoucherScreen
        ? Container(
            color: secondaryColor,
            width: size.width,
            child: Column(
              children: [
                CustomBackButton(action: togglePaymentVoucherScreen),
                const NewPaymentScreen(),
              ],
            ),
          )
        :

        ///payment voucher screen body
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
                        count: '30',
                        title: 'Payment Voucher',
                      ),
                      CustomTextFormField(
                        width: tfw,
                        title: 'Quick search a payment voucher',
                        hintText: 'Enter search word',
                        suffixIcon: Icons.search,
                      ),
                      CustomDropdownWithTitle(
                        hintText: "All payment voucher",
                        title: 'Filter Payment Voucher',
                        width: tfw,
                        value: selectedPaymentVoucher,
                        items: paymentVoucherList,
                        onChanged: (newValue) {
                          if (newValue != null) {
                            setState(() {
                              selectedPaymentVoucher = newValue;
                            });
                          }
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: CTAButton(
                          isTopPadding: false,
                          submitTitle: 'Add Payment Voucher',
                          action: () {
                            togglePaymentVoucherScreen();
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
                    const PageHeader(title: 'All Payment Voucher'),
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
