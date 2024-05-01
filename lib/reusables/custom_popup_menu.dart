import 'package:erp_system/reusables/sized_box_hw.dart';
import 'package:flutter/material.dart';

import '../constants/app_assets_constants.dart';

class CustomPopUpMenu extends StatelessWidget {
  final List<PopupMenuEntry> menuList;
  final Widget? icon;
  const CustomPopUpMenu({
    super.key,
    this.icon,
    required this.menuList,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      position: PopupMenuPosition.under,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      itemBuilder: ((context) => menuList),
      icon: icon,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage(AssetsConstants.bg1),
            ),
          ),
          const Text(
            "Otor John\nHR office",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          wb5,
        ],
      ),
    );
  }
}
