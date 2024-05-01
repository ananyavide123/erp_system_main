import 'package:flutter/material.dart';

import '../../../reusables/colors.dart';
import '../../../reusables/sized_box_hw.dart';
import 'auth_widget/user_password.dart';

class PasswordReset extends StatefulWidget {
  const PasswordReset({super.key});
  @override
  State<PasswordReset> createState() => _LoginFormState();
}

class _LoginFormState extends State<PasswordReset> {
  bool isChecked = false;
  ValueNotifier<bool> viewPassword = ValueNotifier<bool>(true);
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 500,
                  child: Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Image.asset(
                                    "assets/images/logo.jpg",
                                    height: 40,
                                    width: 50,
                                  ),
                                  const Text("ERP System"),
                                ],
                              ),
                              OutlinedButton(
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(side: const BorderSide(color: primaryColor)),
                                child: const Text(
                                  "Sign Up",
                                  style: TextStyle(color: primaryColor),
                                ),
                              ),
                            ],
                          ),
                          hb10,
                          const Text("Password recovery"),
                          const Text(
                            "Password reset",
                            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          const Text("Kindly enter a new password"),
                          const Padding(
                            padding: EdgeInsets.only(left: 22),
                            child: Text("New password"),
                          ),
                          UserPassword(
                            viewPassword: viewPassword,
                            passwordController: passwordController,
                            title: 'Password',
                          ),
                          const SizedBox(height: 30),
                          const Padding(
                            padding: EdgeInsets.only(left: 22),
                            child: Text("Confirm new password"),
                          ),
                          UserPassword(
                            viewPassword: viewPassword,
                            passwordController: passwordController,
                            title: 'Confirm new Password',
                          ),
                          hb40,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 40,
                                width: 300,
                                child: OutlinedButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                      (Set<MaterialState> states) {
                                        if (states.contains(MaterialState.hovered)) {
                                          return secondaryColor;
                                        }
                                        return primaryColor;
                                      },
                                    ),
                                    foregroundColor: MaterialStateProperty.all(black),
                                  ),
                                  child: const Text("Reset"),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Image.asset(
              "assets/images/bg1.jpg",
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
