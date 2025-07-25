import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wei_admin/features/buildteam/presentation/addmembers_screen.dart';
import 'package:wei_admin/features/buildteam/presentation/buildteam_screen.dart';
import 'package:wei_admin/features/profile/presentation/admin_profile_screen.dart';
import 'package:wei_admin/features/profile/presentation/others_profile_screen.dart';
import 'package:wei_admin/features/settings/presentation/main_settings_screen.dart';
import 'package:wei_admin/features/settings/presentation/personal_details_screen.dart';
import 'package:wei_admin/features/settings/presentation/pw_security_screen.dart';
import 'package:wei_admin/routes/app_route_constants.dart';
import 'package:wei_admin/features/auth/presentation/screens/admin_signup_screen.dart';
import 'package:wei_admin/features/auth/presentation/screens/login_screen.dart';
import 'package:wei_admin/features/auth/presentation/screens/organization_signup_screen.dart';
import 'package:wei_admin/features/auth/presentation/screens/otp_forgot_password_screen.dart';
import 'package:wei_admin/features/auth/presentation/screens/otp_verification_screen.dart';
import 'package:wei_admin/features/home/presentation/screens/home_screen.dart';
import 'package:wei_admin/features/navbar/presentation/screens/navbar_control_screen.dart';
import 'package:wei_admin/features/auth/presentation/screens/forgot_password_screen.dart';
import 'package:wei_admin/features/auth/presentation/screens/reset_password_screen.dart';
import 'package:wei_admin/features/onboard/presentation/screens/onboard_screen.dart';
import 'package:wei_admin/features/auth/presentation/screens/signup_type_selection_screen.dart';

class AppRouteConfiguration {
  static final GoRouter router = GoRouter(
    initialLocation: "/personal_details",
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
          final data = state.extra as Map<String, String>;
          final email = data['email']!;
          final contactNumber = data['contactNumber']!;
          log("$email --- $contactNumber");
          return MaterialPage(
            child: OtpVerificationScreen(
              email: email,
              contactNumber: contactNumber,
            ),
          );
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
      GoRoute(
        name: AppRouteNames.buildTeam1,
        path: '/build_team_screen1',
        pageBuilder: (context, state) =>
            MaterialPage(child: BuildTeamScreen1()),
      ),
      GoRoute(
        name: AppRouteNames.addmembers,
        path: '/add_members',
        pageBuilder: (context, state) =>
            MaterialPage(child: AddmembersScreen()),
      ),
      GoRoute(
        name: AppRouteNames.admin_profile,
        path: '/admin_profile',
        pageBuilder: (context, state) =>
            MaterialPage(child: AdminProfileScreen()),
      ),
      GoRoute(
        name: AppRouteNames.othersProfileScreen,
        path: '/others_profile',
        pageBuilder: (context, state) =>
            MaterialPage(child: OthersProfileScreen()),
      ),
      GoRoute(
        name: AppRouteNames.mainSettings,
        path: '/main_settings',
        pageBuilder: (context, state) =>
            MaterialPage(child: MainSettingsScreen()),
      ),
      GoRoute(
        name: AppRouteNames.personlDetails,
        path: '/personal_details',
        pageBuilder: (context, state) =>
            MaterialPage(child: PersonalDetailsScreen()),
      ),
      GoRoute(
        name: AppRouteNames.pwSecurity,
        path: '/pw_security',
        pageBuilder: (context, state) =>
            MaterialPage(child: PwSecurityScreen()),
      ),
    ],
  );
}
