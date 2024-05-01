import 'package:flutter/material.dart';

import 'constants/app_assets_constants.dart';
import 'reusables/colors.dart';
import 'reusables/increase_width_widget.dart';
import 'reusables/responsive.dart';
import 'reusables/sized_box_hw.dart';
import 'screens/sideMenu/dashboard_app_bar.dart';
import 'screens/sideMenu/side_menu_tile.dart';
import 'screens/sideMenu/side_menu_widget.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String selectedMenuName = '';

  void changeMenuIndex(String selectName) {
    setState(() {
      selectedMenuName = selectName;
    });
  }

  @override
  void initState() {
    super.initState();
    if (title.isNotEmpty) {
      selectedMenuName = title[0];
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: !Responsive.isDesktop(context)
            ? const IncreaseWidth()
            : Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: size.height,
                      color: primaryColor,
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 100,
                            child: Image.asset(AssetsConstants.appLogo, fit: BoxFit.cover),
                          ),
                          hb10,
                          Expanded(
                            child: ListView.builder(
                              itemCount: title.length,
                              itemBuilder: (context, index) {
                                String titleName = title[index];
                                IconData iconName = icon[index];
                                return SideMenuTile(
                                  key: Key(titleName),
                                  selectedName: selectedMenuName,
                                  title: titleName,
                                  action: () {
                                    changeMenuIndex(titleName);
                                  },
                                  icon: iconName,
                                );
                              },
                            ),
                          ),
                          hb10,
                        ],
                      ),
                    ),
                  ),
                  wb10,
                  Expanded(
                    flex: 9,
                    child: Column(
                      children: [
                        DashboardAppBar(title: selectedMenuName),
                        SizedBox(
                          height: size.height - 50,
                          child: selectedMenuName != ""
                              ? menuScreens[selectedMenuName]
                              : const Center(
                                  child: Text("Select a menu to view the details"),
                                ),
                        ),
                      ],
                    ),
                  ),
                  wb10,
                ],
              ),
      ),
    );
  }
}
