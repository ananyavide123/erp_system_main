import 'package:flutter/material.dart';

import '../../reusables/buttons.dart';
import '../../reusables/colors.dart';
import '../../reusables/custom_container.dart';
import '../../reusables/sized_box_hw.dart';
import '../dashboard/dashboard_card.dart';
import 'add_new_item_screen.dart';
import 'stocks_mini_card.dart';
import 'stocks_table.dart';

class StocksAndInventory extends StatefulWidget {
  const StocksAndInventory({super.key});

  @override
  State<StocksAndInventory> createState() => _StocksAndInventoryState();
}

class _StocksAndInventoryState extends State<StocksAndInventory> {
  bool showStocksAndInventoryScreen = false;
  bool showStocksAndInventoryScreenBody = true;

  void toggleStocksAndInventoryScreen() {
    if (showStocksAndInventoryScreen) {
      setState(() {
        showStocksAndInventoryScreenBody = true;
        showStocksAndInventoryScreen = false;
      });
    } else {
      setState(() {
        showStocksAndInventoryScreenBody = false;
        showStocksAndInventoryScreen = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return showStocksAndInventoryScreen
        ? Container(
            color: secondaryColor,
            width: size.width,
            child: Column(
              children: [
                CustomBackButton(action: toggleStocksAndInventoryScreen),
                const SeconsStocksAndInventory(),
              ],
            ),
          )
        : Column(
            children: [
              const StocksMiniCard(),
              hb10,
              CustomContainer(
                height: 70,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const PageHeader(
                        title: "Update Stocks List",
                        isTopPadding: false,
                      ),
                      CTAButton(
                        width: size.width / 5,
                        isTopPadding: false,
                        action: () {
                          toggleStocksAndInventoryScreen();
                        },
                        submitTitle: "Update Stocks",
                      ),
                    ],
                  ),
                ),
              ),
              hb10,
              CustomContainer(
                height: size.height - 340,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const PageHeader(title: 'Stock List'),
                    SizedBox(
                      height: size.height - 390,
                      child: const StockTable(),
                    ),
                  ],
                ),
              ),
            ],
          );
  }
}
