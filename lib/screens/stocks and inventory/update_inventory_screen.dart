import 'package:erp_system/reusables/buttons.dart';
import 'package:flutter/material.dart';

import '../../reusables/colors.dart';
import '../../reusables/custom_dropdown.dart';
import '../../reusables/custom_text_form_field.dart';
import '../../reusables/sized_box_hw.dart';

showStocksAndInventoryDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return const AlertDialog(
        backgroundColor: secondaryColor,
        title: Text(
          "Schedule Maintenance",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        content: ThirdStocksAndInventory(),
      );
    },
  );
}

class ThirdStocksAndInventory extends StatefulWidget {
  const ThirdStocksAndInventory({super.key});

  @override
  State<ThirdStocksAndInventory> createState() => _ThirdStocksAndInventoryState();
}

class _ThirdStocksAndInventoryState extends State<ThirdStocksAndInventory> {
  List<String> itemNameList = [
    "Item1",
    "Item2",
    "Item3",
    "Item4",
  ];

  String selectedCategoryName = '';
  List<String> categoryList = [
    "Standard Price",
    "Inventory Valuation",
    "Average Cost",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: SizedBox(
        height: 700,
        width: 1000,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 10, left: 15),
              child: Text(
                "Add New Item",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {},
                  onHover: (val) {
                    //setState(() {
                    // isHover = val;
                    //});
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          30,
                        ),
                        border: Border.all(
                          color: grey,
                          width: 1.0,
                        ),
                      ),
                      height: 500,
                      width: 300,
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 80.0),
                            child: CircleAvatar(
                              maxRadius: 70,
                              minRadius: 20,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.add_a_photo),
                                  Text("Upload photo"),
                                ],
                              ),
                            ),
                          ),
                          hb40,
                          const Text(
                            "Allowed format",
                            style: TextStyle(fontSize: 9),
                          ),
                          const Text(
                            "JPG,JPEG and PNG",
                            style: TextStyle(fontSize: 10),
                          ),
                          hb20,
                          const Text(
                            "Max file size",
                            style: TextStyle(fontSize: 9),
                          ),
                          const Text(
                            "2MB",
                            style: TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: SizedBox(
                    height: 500,
                    width: 300,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomTextFormField(
                          title: 'Product name',
                          hintText: 'Enter product name',
                        ),
                        hb10,
                        CustomDropdownWithTitle(
                          title: 'Category',
                          hintText: 'Select category',
                          value: selectedCategoryName,
                          items: categoryList,
                          onChanged: (newValue) {
                            if (newValue != null) {
                              setState(() {
                                selectedCategoryName = newValue;
                              });
                            }
                          },
                        ),
                        hb10,
                        const CustomTextFormField(
                          title: 'Unit price',
                          hintText: 'Enter amount',
                        ),
                        hb10,
                        const CustomTextFormField(
                          title: 'Supplier',
                          hintText: 'Enter suppliier name',
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: SizedBox(
                    height: 500,
                    width: 300,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomTextFormField(
                          title: 'Product ID',
                          hintText: 'Enter ID',
                        ),
                        hb10,
                        const CustomTextFormField(
                          title: 'QTY purchased',
                          hintText: 'Enter quantity',
                        ),
                        hb10,
                        const CustomTextFormField(
                          title: 'Total amount',
                          hintText: 'Amount',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            wb20,
            Padding(
              padding: const EdgeInsets.only(top: 35),
              child: SizedBox(
                height: 70,
                width: 300,
                child: CTAButton(
                  action: () {},
                  submitTitle: 'Add Item',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
