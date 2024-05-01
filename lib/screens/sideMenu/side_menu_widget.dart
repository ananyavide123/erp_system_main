import 'package:erp_system/screens/circulars/circular_screen.dart';
import 'package:erp_system/screens/logistic/logistic_screen.dart';
import 'package:erp_system/screens/maintenance/maintenance_screen.dart';
import 'package:erp_system/screens/memo/memo_screen.dart';
import 'package:erp_system/screens/notifications/notifications_screen.dart';
import 'package:erp_system/screens/office%20budget/office_budget_screen.dart';
import 'package:erp_system/screens/procurements/procurement_screen.dart';
import 'package:erp_system/screens/stocks%20and%20inventory/stocks_inventory_screen.dart';
import 'package:flutter/material.dart';

import '../capacityBuilding/capacity_building_screen.dart';
import '../dashboard/dashboard_screen.dart';
import '../paymentVoucher/payment_voucher_screen.dart';

import '../payrollAllScreens/payslip/payroll_screen_with_tabbar.dart';
import '../staff/staff_screen.dart';

///menu title
List<String> title = [
  "Dashboard",
  "Staff",
  "Payment Voucher",
  "Payroll",
  "Memo",
  "Circular",
  "Maintenance",
  "Logistics",
  "Office Budget",
  "Stocks and Inventory",
  "Notifications",
  "Capacity Building",
  "Procurements",
];

///menu icon
List<IconData> icon = [
  Icons.dashboard,
  Icons.group,
  Icons.group,
  Icons.account_balance_wallet,
  Icons.book_rounded,
  Icons.book_online,
  Icons.book_sharp,
  Icons.airport_shuttle,
  Icons.monetization_on,
  Icons.bar_chart,
  Icons.notifications,
  Icons.campaign,
  Icons.shopping_bag,
];

///menu screens
Map<String, Widget> menuScreens = {
  "Dashboard": const Dashboard(),
  "Staff": const StaffScreen(),
  "Payment Voucher": const PaymentVoucherScreen(),
  "Payroll": const PayrollScreenWithTabbar(),
  "Memo": const MemoScreen(),
  "Circular": const CircularScreen(),
  "Maintenance": const MaintenanceScreen(),
  "Logistics": const LogisticScreen(),
  "Office Budget": const OfficeBudgetScreen(),
  "Stocks and Inventory": const StocksAndInventory(),
  "Notifications": const NotificationScreen(),
  "Capacity Building": const CapacityBuilding(),
  "Procurements": const ProcurementScreen(),
};
