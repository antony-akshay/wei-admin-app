import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wei_admin/common_widgets/custom_inner_shadow_icon_button.dart';
import 'package:wei_admin/common_widgets/custom_text.dart';
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
                        GoRouter.of(context).pushNamed(AppRouteNames.personlDetails);
                      },
                      title: 'Personal details',
                      leadingIconPath: 'assets/icons/authentication/person.svg',
                    ),
                    SettingsTile(
                      onTap: () {
                        GoRouter.of(context).pushNamed(AppRouteNames.pwSecurity);
                      },
                      title: 'Password & security',
                      leadingIconPath: 'assets/icons/settings/security.svg',
                    ),
                    GlowingDivider(),
                    SizedBox(height: 16.h),

                    sectionHeader('How to use Wie centre'),
                    SettingsTile(
                      title: 'Edit profile',
                      leadingIconPath: 'assets/icons/settings/edit.svg',
                    ),
                    SettingsTile(
                      title: 'Notifications settings',
                      leadingIconPath:
                          'assets/icons/settings/notifications.svg',
                    ),
                    GlowingDivider(),
                    SizedBox(height: 16.h),

                    sectionHeader('For professional use'),
                    SettingsTile(
                      title: 'Third party account linking',
                      leadingIconPath: 'assets/icons/settings/3rdpart.svg',
                    ),
                    SettingsTile(
                      title: 'One post everywhere',
                      leadingIconPath: 'assets/icons/settings/onepost.svg',
                    ),
                    SettingsTile(
                      title: 'Role and permissions',
                      leadingIconPath: 'assets/icons/settings/role.svg',
                    ),
                    GlowingDivider(),
                    SizedBox(height: 16.h),

                    sectionHeader('What you see'),
                    SettingsTile(
                      title: 'Languages and region',
                      leadingIconPath: 'assets/icons/settings/language.svg',
                    ),
                    GlowingDivider(),
                    SizedBox(height: 16.h),

                    sectionHeader('Your activity'),
                    SettingsTile(
                      title: 'Events hosted',
                      leadingIconPath:
                          'assets/icons/settings/events_hosted.svg',
                    ),
                    SettingsTile(
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
                      title: 'Hide details',
                      leadingIconPath: 'assets/icons/settings/hide.svg',
                    ),
                    SettingsTile(
                      title: 'Blocked accounts',
                      leadingIconPath: 'assets/icons/settings/block.svg',
                    ),
                    GlowingDivider(),
                    SizedBox(height: 16.h),
                    ListTile(
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
                    ListTile(
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
