import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wei_admin/common_widgets/cancel_button.dart';
import 'package:wei_admin/common_widgets/custom_inner_shadow_icon_button.dart';
import 'package:wei_admin/common_widgets/custom_text.dart';
import 'package:wei_admin/features/buildteam/widgets/buildteam_button.dart';
import 'package:wei_admin/routes/app_route_constants.dart';

class MainSettingsScreen extends StatelessWidget {
  const MainSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: CustomInnerShadowIconButton(
                      iconPath: "assets/icons/common/arrow_back.svg",
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Settings',
                          style: GoogleFonts.urbanist(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          'Manage your profile, notifications, and preferences your way.',
                          style: GoogleFonts.urbanist(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(129, 129, 129, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    sectionHeader('Wie account centre'),
                    SettingsTile(
                      onTap: () {
                        GoRouter.of(
                          context,
                        ).pushNamed(AppRouteNames.personlDetails);
                      },
                      title: 'Personal details',
                      leadingIconPath: 'assets/icons/authentication/person.svg',
                    ),
                    SettingsTile(
                      onTap: () {
                        GoRouter.of(
                          context,
                        ).pushNamed(AppRouteNames.pwSecurity);
                      },
                      title: 'Password & security',
                      leadingIconPath: 'assets/icons/settings/security.svg',
                    ),
                    GlowingDivider(),
                    SizedBox(height: 16.h),

                    sectionHeader('How to use Wie centre'),
                    SettingsTile(
                      onTap: () {
                        GoRouter.of(
                          context,
                        ).pushNamed(AppRouteNames.editprofile);
                      },
                      title: 'Edit profile',
                      leadingIconPath: 'assets/icons/settings/edit.svg',
                    ),
                    SettingsTile(
                      onTap: () {
                        GoRouter.of(
                          context,
                        ).pushNamed(AppRouteNames.notificationSettings);
                      },
                      title: 'Notifications settings',
                      leadingIconPath:
                          'assets/icons/settings/notifications.svg',
                    ),
                    GlowingDivider(),
                    SizedBox(height: 16.h),

                    sectionHeader('For professional use'),
                    SettingsTile(
                      onTap: () {
                        GoRouter.of(
                          context,
                        ).pushNamed(AppRouteNames.thirdpartyconnect);
                      },
                      title: 'Third party account linking',
                      leadingIconPath: 'assets/icons/settings/3rdpart.svg',
                    ),
                    SettingsTile(
                      onTap: () {
                        GoRouter.of(
                          context,
                        ).pushNamed(AppRouteNames.onePostEverywhere);
                      },
                      title: 'One post everywhere',
                      leadingIconPath: 'assets/icons/settings/onepost.svg',
                    ),
                    SettingsTile(
                      onTap: () {
                        GoRouter.of(
                          context,
                        ).pushNamed(AppRouteNames.permissionsAndRoles);
                      },
                      title: 'Role and permissions',
                      leadingIconPath: 'assets/icons/settings/role.svg',
                    ),
                    GlowingDivider(),
                    SizedBox(height: 16.h),

                    sectionHeader('What you see'),
                    SettingsTile(
                      onTap: () {
                        GoRouter.of(
                          context,
                        ).pushNamed(AppRouteNames.language_region);
                      },
                      title: 'Languages and region',
                      leadingIconPath: 'assets/icons/settings/language.svg',
                    ),
                    GlowingDivider(),
                    SizedBox(height: 16.h),

                    sectionHeader('Your activity'),
                    SettingsTile(
                      onTap: () {
                        GoRouter.of(
                          context,
                        ).pushNamed(AppRouteNames.events_hosted);
                      },
                      title: 'Events hosted',
                      leadingIconPath:
                          'assets/icons/settings/events_hosted.svg',
                    ),
                    SettingsTile(
                      onTap: () {
                        GoRouter.of(
                          context,
                        ).pushNamed(AppRouteNames.bank_details);
                      },
                      title: 'Bank accounts',
                      leadingIconPath: 'assets/icons/settings/bank.svg',
                    ),
                    SettingsTile(
                      title: 'Subscription plans',
                      leadingIconPath: 'assets/icons/settings/subscription.svg',
                    ),
                    GlowingDivider(),
                    SizedBox(height: 16.h),

                    sectionHeader('Who can see your content'),
                    SettingsTile(
                      title: 'Account privacy',
                      leadingIconPath: 'assets/icons/settings/privacy.svg',
                    ),
                    SettingsTile(
                      onTap: () {
                        GoRouter.of(
                          context,
                        ).pushNamed(AppRouteNames.hide_details);
                      },
                      title: 'Hide details',
                      leadingIconPath: 'assets/icons/settings/hide.svg',
                    ),
                    SettingsTile(
                      onTap: () {
                        GoRouter.of(
                          context,
                        ).pushNamed(AppRouteNames.blocked_accounts);
                      },
                      title: 'Blocked accounts',
                      leadingIconPath: 'assets/icons/settings/block.svg',
                    ),
                    GlowingDivider(),
                    SizedBox(height: 16.h),
                    GestureDetector(
                      onTap: () {
                        GoRouter.of(
                          context,
                        ).pushNamed(AppRouteNames.delete_account);
                      },
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: SizedBox(
                          width: 25,
                          height: 25,
                          child: SvgPicture.asset(
                            'assets/icons/settings/delete.svg',
                            color: Colors.red,
                          ),
                        ),
                        title: CustomText(
                          text: 'Delete account',
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          fontColor: Colors.red,
                        ),
                        trailing: SizedBox(
                          width: 20,
                          height: 20,
                          child: SvgPicture.asset(
                            'assets/icons/common/right_arrow.svg',
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        showCenteredModal(context);
                      },
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: SizedBox(
                          width: 25,
                          height: 25,
                          child: SvgPicture.asset(
                            'assets/icons/settings/logout.svg',
                            color: Colors.red,
                          ),
                        ),
                        title: CustomText(
                          text: 'Logout',
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          fontColor: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Delete & Logout
            ],
          ),
        ),
      ),
    );
  }

  Widget sectionHeader(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: CustomText(
        text: title,
        fontColor: Color.fromRGBO(129, 129, 129, 1),
        fontWeight: FontWeight.w600,
        fontSize: 17,
      ),
    );
  }
}

class SettingsTile extends StatelessWidget {
  final String title;
  final String leadingIconPath;
  final Function()? onTap;

  const SettingsTile({
    super.key,
    required this.title,
    required this.leadingIconPath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: SizedBox(
          width: 26,
          height: 26,
          child: SvgPicture.asset(leadingIconPath),
        ),
        title: CustomText(
          text: title,
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
        trailing: SizedBox(
          width: 20,
          height: 20,
          child: SvgPicture.asset('assets/icons/common/right_arrow.svg'),
        ),
      ),
    );
  }
}

class GlowingDivider extends StatelessWidget {
  const GlowingDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.5,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(0.05),
            Colors.white.withOpacity(0.2),
            Colors.white.withOpacity(0.05),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
    );
  }
}

void showCenteredModal(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.transparent, // No dark overlay; we blur manually
    builder: (context) {
      return Stack(
        children: [
          // Blur Background
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2.2, sigmaY: 2.2),
            child: Container(
              color: Colors.black.withOpacity(0.3), // Optional dark tint
            ),
          ),
          // Centered Modal
          Center(
            child: Container(
              width: 350,
              height: 250,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Color.fromRGBO(56, 56, 56, 1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Material(
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: 'Are you sure?',
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                    const SizedBox(height: 12),
                    CustomText(
                      text:
                          'We’ll log you out from this device. You can always come back anytime.',
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),
                    Row(
                      children: [
                        Expanded(
                          child: CancelButton(
                            label: 'Cancel',
                            onTap: () => Navigator.pop(context),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: BuildteamButton(
                            label: 'Logout',
                            onTap: () {
                              Navigator.pop(context); // Close modal
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}
