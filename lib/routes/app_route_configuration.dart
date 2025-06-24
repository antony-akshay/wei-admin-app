import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wei_admin/routes/app_route_constants.dart';
import 'package:wei_admin/screens/authentication/admin_signup_screen.dart';
import 'package:wei_admin/screens/authentication/login_screen.dart';
import 'package:wei_admin/screens/authentication/organization_signup_screen.dart';
import 'package:wei_admin/screens/authentication/otp_verification_screen.dart';

class AppRouteConfiguration {
  static final GoRouter router = GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(
        name: AppRouteConstants.login,
        path: "/login",
        pageBuilder: (context, state) {
          return MaterialPage(child: LoginScreen());
        },
      ),
      GoRoute(
        name: AppRouteConstants.adminSignup,
        path: "/admin_signup",
        pageBuilder: (context, state) {
          return MaterialPage(child: AdminSignupScreen());
        },
      ),
      GoRoute(
        name: AppRouteConstants.organizationSignup,
        path: "/organization_signup",
        pageBuilder: (context, state) {
          return MaterialPage(child: OrganizationSignupScreen());
        },
      ),
      GoRoute(
        name: AppRouteConstants.otpVerification,
        path: "/otp_verification",
        pageBuilder: (context, state) {
          return MaterialPage(child: OtpVerificationScreen());
        },
      ),
    ],
  );
}
