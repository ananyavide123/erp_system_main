import 'package:flutter/material.dart';

import '../../reusables/sized_box_hw.dart';
import 'dashboard_card.dart';
import 'dashboard_mini_card.dart';
import 'payment_table.dart';
import 'staff_table.dart';
import 'memo_table.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const DashboardMiniCard(),
          hb10,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      ///memo card
                      const DashboardCard(
                        title: 'Memo',
                        tableData: MemoTable(),
                      ),
                      hb10,

                      ///staff list card
                      const DashboardCard(
                        title: 'Payment Voucher',
                        tableData: PaymentTable(),
                      ),
                    ],
                  ),
                ),
                wb15,
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      ///payment vouchers card
                      const DashboardCard(
                        title: 'Staff List',
                        tableData: StaffTable(),
                      ),
                      hb10,

                      ///staff application card
                      const DashboardCard(
                        title: 'Staff Applicattion Card',
                        tableData: MemoTable(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
