import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wei_admin/features/buildteam/presentation/addmembers_screen.dart';
import 'package:wei_admin/features/buildteam/presentation/buildteam_screen.dart';
import 'package:wei_admin/features/create_event/presentation/screens/add_on_events_managing_screen.dart';
import 'package:wei_admin/features/create_event/presentation/screens/add_on_events_yes_or_no_screen.dart';
import 'package:wei_admin/features/create_event/presentation/screens/ticket_details_adding_screen.dart';
import 'package:wei_admin/features/profile/presentation/admin_profile_screen.dart';
import 'package:wei_admin/features/profile/presentation/others_profile_screen.dart';
import 'package:wei_admin/features/settings/presentation/change_pw_screen.dart';
import 'package:wei_admin/features/settings/presentation/login_alerts_screen.dart';
import 'package:wei_admin/features/settings/presentation/login_history_screen.dart';
import 'package:wei_admin/features/settings/presentation/main_settings_screen.dart';
import 'package:wei_admin/features/settings/presentation/personal_details_screen.dart';
import 'package:wei_admin/features/settings/presentation/pw_security_screen.dart';
import 'package:wei_admin/features/settings/presentation/save_login_info_screen.dart';
import 'package:wei_admin/features/settings/presentation/security_questions_screen.dart';
import 'package:wei_admin/features/settings/presentation/two_factor_auth_screen.dart';
import 'package:wei_admin/features/settings/presentation/two_factor_code_screen.dart';
import 'package:wei_admin/features/chat/presentation/screens/view_contact_screen.dart';
import 'package:wei_admin/features/create_event/presentation/screens/add_visuals_to_your_event_screen.dart';
import 'package:wei_admin/features/create_event/presentation/screens/describe_your_event_screen.dart';
import 'package:wei_admin/features/create_event/presentation/screens/edit_guest_screen.dart';
import 'package:wei_admin/features/create_event/presentation/screens/event_basics_screen.dart';
import 'package:wei_admin/features/create_event/presentation/screens/event_creation_yes_or_no_screen.dart';
import 'package:wei_admin/features/create_event/presentation/screens/guest_details_adding_screen.dart';
import 'package:wei_admin/features/create_event/presentation/screens/guest_yes_or_no_screen.dart';
import 'package:wei_admin/features/create_event/presentation/screens/pin_the_place_screen.dart';
import 'package:wei_admin/features/create_event/presentation/screens/when_it_happening_screen.dart';
import 'package:wei_admin/features/settings/presentation/two_factor_otp_screen.dart';
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
    // initialLocation: "/navbar_control",
    initialLocation: "/sec_questions",
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
      GoRoute(
        name: AppRouteNames.changePw,
        path: '/change_pw',
        pageBuilder: (context, state) => MaterialPage(child: ChangePwScreen()),
      ),
      GoRoute(
        name: AppRouteNames.twofactor,
        path: '/two_factor',
        pageBuilder: (context, state) =>
            MaterialPage(child: TwoFactorAuthScreen()),
      ),
      GoRoute(
        name: AppRouteNames.twofactorcodesend,
        path: '/two_factor_code_send',
        pageBuilder: (context, state) =>
            MaterialPage(child: TwoFactorCodeScreen()),
      ),
      GoRoute(
        name: AppRouteNames.viewContact,
        path: '/view_contact',
        pageBuilder: (context, state) =>
            MaterialPage(child: ViewContactScreen()),
      ),
      GoRoute(
        name: AppRouteNames.eventCreationYesOrNo,
        path: '/event_creation_yes_or_no',
        pageBuilder: (context, state) =>
            MaterialPage(child: EventCreationYesOrNoScreen()),
      ),
      GoRoute(
        name: AppRouteNames.eventBasics,
        path: '/event_basics',
        pageBuilder: (context, state) {
          final bool showProgress = state.extra as bool? ?? false;
          return MaterialPage(
            child: EventBasicsScreen(showProgress: showProgress),
          );
        },
      ),
      GoRoute(
        name: AppRouteNames.pinThePlace,
        path: '/pin_the_place',
        pageBuilder: (context, state) {
          final bool showProgress = state.extra as bool? ?? false;
          return MaterialPage(
            child: PinThePlaceScreen(showProgress: showProgress),
          );
        },
      ),
      GoRoute(
        name: AppRouteNames.guestYesOrNo,
        path: '/guest_yes_or_no',
        pageBuilder: (context, state) =>
            MaterialPage(child: GuestYesOrNoScreen()),
      ),
      GoRoute(
        name: AppRouteNames.guestDetailsAdding,
        path: '/guest_details_adding',
        pageBuilder: (context, state) =>
            MaterialPage(child: GuestDetailsAddingScreen()),
      ),
      GoRoute(
        name: AppRouteNames.editGuest,
        path: '/edit_guest',
        pageBuilder: (context, state) => MaterialPage(child: EditGuestScreen()),
      ),
      GoRoute(
        name: AppRouteNames.whenItHappening,
        path: '/when_it_happening',
        pageBuilder: (context, state) {
          final bool showProgress = state.extra as bool? ?? false;
          return MaterialPage(
            child: WhenItHappeningScreen(showProgress: showProgress),
          );
        },
      ),
      GoRoute(
        name: AppRouteNames.describeYourEvent,
        path: '/describe_your_event',
        pageBuilder: (context, state) =>
            MaterialPage(child: DescribeYourEventScreen()),
      ),

      GoRoute(
        name: AppRouteNames.addVisualsToYourEvent,
        path: '/add_visuals_to_your_event',
        pageBuilder: (context, state) =>
            MaterialPage(child: AddVisualsToYourEventScreen()),
      ),
      GoRoute(
        name: AppRouteNames.addOnEventsYesOrNo,
        path: '/add_on_events_yes_or_no',
        pageBuilder: (context, state) =>
            MaterialPage(child: AddOnEventsYesOrNoScreen()),
      ),
      GoRoute(
        name: AppRouteNames.addOnEventsManaging,
        path: '/add_on_events_managing',
        pageBuilder: (context, state) =>
            MaterialPage(child: AddOnEventsManagingScreen()),
      ),
      GoRoute(
        name: AppRouteNames.ticketDetailsAdding,
        path: '/ticket_details_adding',
        pageBuilder: (context, state) {
          final bool isAddingNextTicket = state.extra as bool? ?? false;
          return MaterialPage(
            child: TicketDetailsAddingScreen(
              isAddingNextTicket: isAddingNextTicket,
            ),
          );
        },
        
      GoRoute(
        name: AppRouteNames.twofactorotp,
        path: '/OTPInputScreen',
        pageBuilder: (context, state) =>
            MaterialPage(child: TwoFactorOtpScreen()),
      ),
      GoRoute(
        name: AppRouteNames.SaveLoginInfo,
        path: '/save_login_info',
        pageBuilder: (context, state) =>
            MaterialPage(child: SaveLoginInfoScreen()),
      ),
      GoRoute(
        name: AppRouteNames.LoginHistory,
        path: '/login_history',
        pageBuilder: (context, state) =>
            MaterialPage(child: LoginHistoryScreen()),
      ),
      GoRoute(
        name: AppRouteNames.LoginAlert,
        path: '/login_alert',
        pageBuilder: (context, state) =>
            MaterialPage(child: LoginAlertsScreen()),
      ),
      GoRoute(
        name: AppRouteNames.secQuestions,
        path: '/sec_questions',
        pageBuilder: (context, state) =>
            MaterialPage(child: SecurityQuestionsScreen()),
      ),
    ],
  );
}
