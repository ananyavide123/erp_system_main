import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import 'colors.dart';
import 'sized_box_hw.dart';

class CustomDropdownWithTitle extends StatelessWidget {
  const CustomDropdownWithTitle({
    super.key,
    this.value,
    this.width,
    this.hintText,
    this.height,
    this.validator,
    this.fillColor,
    required this.title,
    required this.items,
    required this.onChanged,
    this.isExpanded = false,
    this.labelText,
  });
  final String title;
  final String? hintText;
  final String? value;
  final String? labelText;
  final Color? fillColor;
  final double? width;
  final double? height;
  final bool isExpanded;
  final List<String> items;
  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10, right: 10),
          child: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        wb10,
        SizedBox(
          width: width ?? (size.width * 0.15),
          child: DropdownButtonFormField2<String>(
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
              filled: true,
              fillColor: fillColor ?? secondaryColor,
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: black),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: black),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
            ),
            iconStyleData: const IconStyleData(
              icon: Icon(Icons.expand_more),
              iconEnabledColor: black,
            ),
            items: items.map<DropdownMenuItem<String>>((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item, overflow: TextOverflow.ellipsis, style: const TextStyle(color: black, fontSize: 15)),
              );
            }).toList(),
            hint: Text(
              hintText ?? "Select options",
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
            value: value == '' ? null : value,
            isExpanded: isExpanded,
            onChanged: onChanged,
            validator: validator,
            onSaved: onChanged,
            dropdownStyleData: DropdownStyleData(
              elevation: 1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: secondaryColor,
              ),
            ),
            menuItemStyleData: const MenuItemStyleData(
              padding: EdgeInsets.symmetric(horizontal: 8),
            ),
          ),
        ),
      ],
    );
  }
}
