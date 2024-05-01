
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


import '../screens/auth/loginForm/email_verification.dart';
import '../screens/auth/loginForm/forgot_password.dart';
import '../screens/auth/loginForm/login_form.dart';
import '../screens/auth/loginForm/otp_verify_screen.dart';
import '../screens/auth/loginForm/password_reset.dart';

import '../screens/dashboard/dashboard_screen.dart';
import '../screens/paymentVoucher/payment_voucher_screen.dart';
import '../screens/staff/add_new_staff.dart';
import '../screens/staff/edit_staff_screen.dart';
import '../screens/staff/staff_screen.dart';
import 'app_route_constant.dart';

final goRouter = GoRouter(
  initialLocation: AppNamedRoutes.loginForm,
  routes: [
   
    GoRoute(
      path: AppNamedRoutes.loginForm,
      builder: (BuildContext context, GoRouterState state) => const LoginForm(),
    ),
    GoRoute(
      path: AppNamedRoutes.otpVerifyScreen,
      builder: (BuildContext context, GoRouterState state) => const OtpVerifyScreen(),
    ),
    GoRoute(
      path: AppNamedRoutes.dashboard,
      builder: (BuildContext context, GoRouterState state) => const Dashboard(),
    ),
    GoRoute(
      path: AppNamedRoutes.forgotPassword,
      builder: (BuildContext context, GoRouterState state) => const ForgotPassword(),
    ),
    GoRoute(
      path: AppNamedRoutes.emailVerification,
      builder: (BuildContext context, GoRouterState state) => const EmailVerification(),
    ),
    GoRoute(
      path: AppNamedRoutes.passwordReset,
      builder: (BuildContext context, GoRouterState state) => const PasswordReset(),
    ),
    GoRoute(
      path: AppNamedRoutes.staffScreen,
      builder: (BuildContext context, GoRouterState state) => const StaffScreen(),
    ),
    GoRoute(
      path: AppNamedRoutes.addStaffWidget,
      builder: (BuildContext context, GoRouterState state) => const AddStaffWidget(),
    ),
    GoRoute(
      path: AppNamedRoutes.editStaffWidget,
      builder: (BuildContext context, GoRouterState state) => const EditStaffWidget(),
    ),
    GoRoute(
      path: AppNamedRoutes.paymentVoucherScreen,
      builder: (BuildContext context, GoRouterState state) => const PaymentVoucherScreen(),
    ),
   
  ],
);
