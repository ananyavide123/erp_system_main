import 'package:flutter/material.dart';

import '../../main_app.dart';
import '../../services/auth_services.dart';
import 'loginForm/login_form.dart';

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({super.key});

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  AuthenticationService auth = AuthenticationService();
  @override
  Widget build(BuildContext context) {
    // return either the main or Authenticate screen
    if (auth.currentUser() == null) {
      return const LoginForm();
    } else {
      return const MainApp();
    }
  }
}
