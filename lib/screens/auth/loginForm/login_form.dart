import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/authBlocs/login_with_email_bloc.dart';
import '../../../constants/app_assets_constants.dart';
import '../../../main_app.dart';
import '../../../reusables/buttons.dart';
import '../../../reusables/colors.dart';
import '../../../reusables/custom_text_form_field.dart';
import '../../../reusables/loading_screen.dart';
import '../../../reusables/navigators.dart';
import '../../../reusables/sized_box_hw.dart';
import '../../../reusables/snack_bar.dart';
import '../../../services/validators.dart';
import 'auth_widget/user_password.dart';
import 'sign_up_screen.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> loginFormFormKey = GlobalKey<FormState>();
  Map<String, dynamic> loginFormDataMap = <String, dynamic>{};
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  ValueNotifier<bool> viewPassword = ValueNotifier<bool>(true);
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<EmailAuthBloc, EmailAuthState>(
      listener: (context, eas) {
        if (eas is EmailAuthFailure) {
          showSnackBar(context, eas.error, error: true);
        }
        if (eas is EmailAuthSuccess) {
          pushSimple(context, const MainApp());
          showSnackBar(
            context,
            "Logged in Email:${eas.authResult!.user!.email}",
          );
        }
      },
      builder: (context, eas) {
        return eas is EmailAuthProgress
            ? const LoadingScreen(message: "Logging you in")
            : Scaffold(
                extendBody: true,
                extendBodyBehindAppBar: true,
                body: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Form(
                        key: loginFormFormKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
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
                                            AssetsConstants.logo,
                                            height: 40,
                                            width: 50,
                                          ),
                                          const Text("ERP System"),
                                        ],
                                      ),
                                      CTAButton(
                                        action: () {
                                          pushSimple(context, const SignUpScreen());
                                        },
                                        submitTitle: "Sign Up",
                                      ),
                                    ],
                                  ),
                                  hb10,
                                  const Text("WelcomeBack!!"),
                                  const Text(
                                    "Please Sign In",
                                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                                  ),
                                  hb40,
                                  CustomTextFormField(
                                    width: size.width,
                                    title: 'Email address',
                                    hintText: 'Enter email address',
                                    controller: emailController,
                                    validator: (String? val) {
                                      return Validators.validateEmail(val!, true);
                                    },
                                  ),
                                  hb20,
                                  UserPassword(
                                    width: 700,
                                    viewPassword: viewPassword,
                                    passwordController: passwordController,
                                    title: 'Password',
                                  ),
                                  hb10,
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Checkbox(
                                            value: rememberMe,
                                            activeColor: primaryColor,
                                            onChanged: (val) {
                                              setState(() {
                                                rememberMe = val!;
                                              });
                                            },
                                          ),
                                          const Text("Remember me"),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 10),
                                        child: TextButton(
                                          onPressed: () {},
                                          child: const Text(
                                            "I forgot my password",
                                            style: TextStyle(color: primaryColor),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  hb10,
                                  CTAButton(
                                    width: 500,
                                    submitTitle: 'Sign In',
                                    action: () {
                                      if (loginFormFormKey.currentState!.validate()) {
                                        loginFormFormKey.currentState?.save();
                                        context.read<EmailAuthBloc>().add(
                                              LoginUsingEmail(
                                                email: emailController.text,
                                                remember: rememberMe,
                                                password: passwordController.text,
                                              ),
                                            );
                                      } else {
                                        showSnackBar(context, "Invalid email or password, Please retry", error: true);
                                      }
                                    },
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Image.asset(
                        AssetsConstants.bg1,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }
}
