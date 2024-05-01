import 'package:erp_system/reusables/buttons.dart';
import 'package:flutter/material.dart';

import 'package:pinput/pinput.dart';

import '../../../reusables/sized_box_hw.dart';
import 'password_reset.dart';

class EmailVerification extends StatefulWidget {
  const EmailVerification({Key? key}) : super(key: key);

  @override
  State<EmailVerification> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<EmailVerification> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();
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
                      const SizedBox(height: 100),
                      const Text("Password recovery"),
                      const Text(
                        "Email verification",
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                        maxLines: 2,
                      ),
                      const Text("Kindly enter the 6 digit code that has been sent to your\nemail address"),
                      hb80,
                      Form(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Directionality(
                              textDirection: TextDirection.ltr,
                              child: Pinput(
                                length: 6,
                                controller: pinController,
                                focusNode: focusNode,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                CTAButton(
                  action: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PasswordReset()),
                    );
                  },
                  submitTitle: 'Send',
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Image.asset(
              "assets/images/bg7.jpg",
              height: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
