import 'package:erp_system/reusables/buttons.dart';
import 'package:flutter/material.dart';

import '../../../reusables/sized_box_hw.dart';
import 'email_verification.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});
  @override
  State<ForgotPassword> createState() => _LoginFormState();
}

class _LoginFormState extends State<ForgotPassword> {
  bool isChecked = false;
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
                hb120,
                SizedBox(
                  width: 500,
                  child: Column(
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
                          CTAButton(
                            action: () {},
                            submitTitle: "Sign Up",
                          ),
                        ],
                      ),
                      hb10,
                      const Text("Password recovery"),
                      const Text(
                        "Forgot your password?",
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      hb10,
                      const Text("Kindly enter the email address linked to this account and\n we will send you a code to enable you change your\n password"),
                      hb10,
                      const SizedBox(height: 50),
                      const Text("Email address"),
                      hb10,
                      const TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter email address',
                        ),
                      ),
                      hb40,
                      CTAButton(
                        action: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const EmailVerification()),
                          );
                        },
                        submitTitle: "Send",
                      ),
                    ],
                  ),
                ),
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
