import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/addBlocs/registration_data_saving_bloc.dart';
import '../../../blocs/authBlocs/sign_up_bloc.dart';
import '../../../constants/app_assets_constants.dart';
import '../../../reusables/buttons.dart';
import '../../../reusables/colors.dart';
import '../../../reusables/custom_text_form_field.dart';
import '../../../reusables/loading_screen.dart';
import '../../../reusables/navigators.dart';
import '../../../reusables/sized_box_hw.dart';
import '../../../reusables/snack_bar.dart';
import '../../../services/validators.dart';
import 'auth_widget/user_password.dart';
import 'login_form.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> signUpFormFormKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  ValueNotifier<bool> viewPassword = ValueNotifier<bool>(true);
  Map<String, dynamic> finalSignupData = {};
  bool rememberMe = false;
  double tfw = 400;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EmailSignupBloc, EmailSignupState>(
      listener: (context, ess) {
        if (ess is EmailSignupFailure) {
          showSnackBar(context, ess.error, error: true);
        }
        if (ess is EmailSignupSuccess) {
          context.read<RegistrationDataBloc>().add(SaveRegistrationData(registrationData: finalSignupData));
          pushSimple(context, const LoginForm());
          showSnackBar(context, "Sign up successfully.");
        }
      },
      builder: (context, ess) {
        return ess is EmailSignupProgress
            ? const LoadingScreen(message: "Sign up ")
            : Scaffold(
                extendBody: true,
                extendBodyBehindAppBar: true,
                body: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: SizedBox(
                        width: 500,
                        child: Form(
                          key: signUpFormFormKey,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              hb120,
                              Image.asset(
                                AssetsConstants.logo,
                                height: 80,
                                width: 150,
                              ),
                              hb10,
                              const Text(
                                "Create Account",
                                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                              CustomTextFormField(
                                controller: usernameController,
                                width: tfw,
                                isTopPadding: true,
                                title: 'Name',
                                hintText: 'Enter name',
                                validatorMessage: 'Name',
                              ),
                              CustomTextFormField(
                                width: tfw,
                                isTopPadding: true,
                                title: 'Email address',
                                hintText: 'Enter email address',
                                controller: emailController,
                                validator: (String? val) {
                                  return Validators.validateEmail(val!, false);
                                },
                              ),
                              UserPassword(
                                width: tfw,
                                isTopPadding: true,
                                viewPassword: viewPassword,
                                passwordController: passwordController,
                                title: 'Password',
                              ),
                              hb10,
                              CTAButton(
                                width: tfw,
                                submitTitle: 'Sign Up',
                                action: () {
                                  finalSignupData = {
                                    "email": emailController.text,
                                    "password": passwordController.text,
                                    "userName": usernameController.text,
                                  };
                                  if (signUpFormFormKey.currentState!.validate()) {
                                    signUpFormFormKey.currentState?.save();
                                    context.read<EmailSignupBloc>().add(RegisterUsingEmail(
                                          signupData: finalSignupData,
                                        ));
                                  } else {
                                    showSnackBar(context, "Invalid email or password, Please retry", error: true);
                                  }
                                },
                              ),
                              hb10,
                              TextButton(
                                onPressed: () {
                                  removeScreen(context, const LoginForm());
                                },
                                child: const Text(
                                  "Already have an Account?Login",
                                  style: TextStyle(color: primaryColor),
                                ),
                              ),
                            ],
                          ),
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
