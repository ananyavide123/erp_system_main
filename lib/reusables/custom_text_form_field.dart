import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.width,
    this.height,
    this.action,
    this.maxLines,
    this.onSaved,
    this.validator,
    this.labelText,
    this.suffixIcon,
    this.controller,
    required this.title,
    this.inputFormatters,
    this.validatorMessage,
    this.readOnly = false,
    required this.hintText,
    this.obscureText = false,
    this.isTopPadding = false,
  });
  final String title;
  final int? maxLines;
  final double? width;
  final bool readOnly;
  final double? height;
  final String hintText;
  final bool obscureText;
  final String? labelText;
  final bool? isTopPadding;
  final IconData? suffixIcon;
  final void Function()? action;
  final String? validatorMessage;
  final void Function(String?)? onSaved;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Padding(
      padding: EdgeInsets.only(top: isTopPadding! ? 15 : 0),
      child: SizedBox(
        width: width ?? (size.width * 0.15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            TextFormField(
              obscureText: obscureText,
              onSaved: onSaved,
              controller: controller,
              inputFormatters: inputFormatters,
              readOnly: readOnly,
              onTap: action,
              maxLines: maxLines ?? 1,
              decoration: InputDecoration(
                labelText: labelText,
                border: const OutlineInputBorder(),
                hintText: hintText,
                suffixIcon: Icon(suffixIcon),
              ),
              validator: validator ??
                  (value) {
                    if (value == null || value.isEmpty) {
                      return "$validatorMessage cannot be empty.";
                    } else {
                      return null;
                    }
                  },
            ),
          ],
        ),
      ),
    );
  }
}
