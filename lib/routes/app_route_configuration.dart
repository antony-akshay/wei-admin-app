import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wei_admin/routes/app_route_constants.dart';
import 'package:wei_admin/screens/authentication/admin_signup_screen.dart';
import 'package:wei_admin/screens/authentication/login_screen.dart';
import 'package:wei_admin/screens/authentication/organization_signup_screen.dart';
import 'package:wei_admin/screens/authentication/otp_verification_screen.dart';
import 'package:wei_admin/screens/onboard/onboard_screen.dart';
import 'package:wei_admin/screens/authentication/signup_type_selection_screen.dart';

class AppRouteConfiguration {
  static final GoRouter router = GoRouter(
    initialLocation: '/onboard',
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
    ],
  );
}
