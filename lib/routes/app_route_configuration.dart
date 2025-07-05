import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wei_admin/routes/app_route_constants.dart';
import 'package:wei_admin/screens/authentication/admin_signup_screen.dart';
import 'package:wei_admin/screens/authentication/login_screen.dart';
import 'package:wei_admin/screens/authentication/organization_signup_screen.dart';
import 'package:wei_admin/screens/authentication/otp_forgot_password_screen.dart';
import 'package:wei_admin/screens/authentication/otp_verification_screen.dart';
import 'package:wei_admin/screens/chat/chat_screen.dart';
import 'package:wei_admin/screens/home/home_screen.dart';
import 'package:wei_admin/screens/navbar/navbar_control_screen.dart';
import 'package:wei_admin/screens/authentication/forgot_password_screen.dart';
import 'package:wei_admin/screens/authentication/reset_password_screen.dart';
import 'package:wei_admin/screens/onboard/onboard_screen.dart';
import 'package:wei_admin/screens/authentication/signup_type_selection_screen.dart';

class AppRouteConfiguration {
  static final GoRouter router = GoRouter(
    initialLocation: '/navbar_control',
    routes: [
      GoRoute(
        name: AppRouteNames.onboard,
        path: "/onboard",
        pageBuilder: (context, state) {
          return MaterialPage(child: OnboardScreen());
        },
      ),
      GoRoute(
        name: AppRouteNames.signupType,
        path: "/signup_type",
        pageBuilder: (context, state) {
          return MaterialPage(child: SignupTypeSelectionScreen());
        },
      ),
      GoRoute(
        name: AppRouteNames.login,
        path: "/login",
        pageBuilder: (context, state) {
          return MaterialPage(child: LoginScreen());
        },
      ),
      GoRoute(
        name: AppRouteNames.adminSignup,
        path: "/admin_signup",
        pageBuilder: (context, state) {
          return MaterialPage(child: AdminSignupScreen());
        },
      ),
      GoRoute(
        name: AppRouteNames.organizationSignup,
        path: "/organization_signup",
        pageBuilder: (context, state) {
          return MaterialPage(child: OrganizationSignupScreen());
        },
      ),
      GoRoute(
        name: AppRouteNames.otpVerification,
        path: "/otp_verification",
        pageBuilder: (context, state) {
          return MaterialPage(child: OtpVerificationScreen());
        },
      ),
      GoRoute(
        name: AppRouteNames.navbarControl,
        path: "/navbar_control",
        pageBuilder: (context, state) {
          return MaterialPage(child: NavbarControlScreen());
        },
      ),
      GoRoute(
        name: AppRouteNames.home,
        path: "/home",
        pageBuilder: (context, state) {
          return MaterialPage(child: HomeScreen());
        },
      ),
      //  GoRoute(
      //   name: AppRouteNames.chat,
      //   path: "/chat",
      //   pageBuilder: (context, state) {
      //     return MaterialPage(child: ChatScreen());
      //   },
      // ),
      GoRoute(
        name: AppRouteNames.forgotPassword,
        path: "/forgot_password",
        pageBuilder: (context, state) {
          return MaterialPage(child: ForgotPassword());
        },
      ),
      GoRoute(
        name: AppRouteNames.otpForgotPassword,
        path: "/otp_forgot_password",
        pageBuilder: (context, state) =>
            MaterialPage(child: OtpForgotPasswordScreen()),
      ),
      GoRoute(
        name: AppRouteNames.resetPassword,
        path: '/reset_password',
        pageBuilder: (context, state) =>
            MaterialPage(child: ResetPasswordScreen()),
      ),

    ],
  );
}
