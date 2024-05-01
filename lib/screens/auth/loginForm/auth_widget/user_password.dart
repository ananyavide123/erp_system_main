import 'package:flutter/material.dart';

import '../../../../reusables/colors.dart';
import '../../../../services/validators.dart';

class UserPassword extends StatelessWidget {
  const UserPassword({
    super.key,
    this.width,
    this.onSaved,
    required this.title,
    this.isTopPadding = false,
    required this.viewPassword,
    required this.passwordController,
  });

  final String title;
  final double? width;
  final bool? isTopPadding;
  final void Function(String?)? onSaved;
  final ValueNotifier<bool> viewPassword;
  final TextEditingController passwordController;
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
            ValueListenableBuilder(
              valueListenable: viewPassword,
              builder: (BuildContext context, bool value, Widget? child) {
                return TextFormField(
                  style: const TextStyle(color: black),
                  controller: passwordController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  obscureText: viewPassword.value,
                  obscuringCharacter: "*",
                  cursorColor: black,
                  cursorWidth: 1,
                  onSaved: onSaved,
                  decoration: InputDecoration(
                    hintText: title,
                    hintStyle: const TextStyle(color: grey, fontWeight: FontWeight.normal),
                    prefixIcon: const Icon(Icons.lock_person, color: grey),
                    suffixIcon: IconButton(
                      icon: Icon(viewPassword.value ? Icons.visibility_off : Icons.visibility, color: grey),
                      onPressed: () {
                        viewPassword.value = !viewPassword.value;
                      },
                    ),
                    labelStyle: const TextStyle(color: grey),
                    focusedBorder: OutlineInputBorder(borderSide: const BorderSide(width: 2, color: primaryColor), borderRadius: BorderRadius.circular(8)),
                    border: OutlineInputBorder(borderSide: const BorderSide(width: 2, color: primaryColor), borderRadius: BorderRadius.circular(8)),
                    focusedErrorBorder: OutlineInputBorder(borderSide: const BorderSide(width: 2, color: red), borderRadius: BorderRadius.circular(8)),
                    errorBorder: OutlineInputBorder(borderSide: const BorderSide(width: 2, color: red), borderRadius: BorderRadius.circular(8)),
                    errorStyle: const TextStyle(color: red),
                  ),
                  validator: (String? val) {
                    return Validators.validatePassword(val!);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
