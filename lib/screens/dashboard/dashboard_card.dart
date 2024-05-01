import 'package:flutter/material.dart';

import '../../reusables/colors.dart';

class DashboardCard extends StatelessWidget {
  const DashboardCard({
    super.key,
    this.tableData,
    required this.title,
  });
  final String title;
  final Widget? tableData;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      width: size.width,
      height: size.height / 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PageHeader(title: title),
          SizedBox(
            height: size.height - 675,
            child: tableData,
          ),
        ],
      ),
    );
  }
}

class PageHeader extends StatelessWidget {
  const PageHeader({
    super.key,
    required this.title,
    this.isTopPadding = true,
  });
  final String title;
  final bool isTopPadding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 12, top: isTopPadding ? 15 : 0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
