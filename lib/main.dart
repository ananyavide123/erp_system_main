import 'package:erp_system/main_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/addBlocs/registration_data_saving_bloc.dart';
import 'blocs/authBlocs/sign_up_bloc.dart';
import 'blocs/authBlocs/login_with_email_bloc.dart';
import 'firebase_options.dart';
import 'reusables/custom_app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => EmailAuthBloc()),
        BlocProvider(create: (context) => EmailSignupBloc()),
        BlocProvider(create: (context) => RegistrationDataBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ERP System',
        theme: appTheme,
        home: const MainApp(),
      ),
    );
  }
}

mixin AppConstants {
  static const String hiveBoxKey = "name_data";
  static const String detailBoxKey = "name_details";
}
