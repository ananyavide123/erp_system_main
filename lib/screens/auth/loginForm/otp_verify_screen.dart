import 'package:erp_system/main_app.dart';
import 'package:erp_system/reusables/buttons.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../../reusables/sized_box_hw.dart';

class OtpVerifyScreen extends StatefulWidget {
  const OtpVerifyScreen({Key? key}) : super(key: key);

  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
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
                        Image.asset(
                          "assets/images/logo.jpg",
                          height: 40,
                          width: 50,
                        ),
                        const Text("ERP System"),
                        const SizedBox(height: 100),
                        const Text("2FA"),
                        const Text(
                          "Please enter the 2FA code\nSent to your mail",
                          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                          maxLines: 2,
                        ),
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
                  hb80,
                  Padding(
                    padding: const EdgeInsets.only(right: 90),
                    child: CTAButton(
                      action: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const MainApp()),
                        );
                      },
                      submitTitle: 'Verify',
                    ),
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
      ),
    );
  }
}
