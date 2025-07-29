import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wei_admin/common_widgets/custom_inner_shadow_icon_button.dart';
import 'package:wei_admin/common_widgets/custom_text.dart';
import 'package:wei_admin/routes/app_route_constants.dart';

class PwSecurityScreen extends StatelessWidget {
  const PwSecurityScreen({super.key});

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
                          'Password and security',
                          style: GoogleFonts.urbanist(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          'Secure your account with a new password and two factor authentication.',
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
                    sectionHeader('Login & recovery'),
                    SettingsTile(
                      onTap: () {
                        GoRouter.of(context).pushNamed(AppRouteNames.changePw);
                      },
                      title: 'Change password',
                      leadingIconPath:
                          'assets/icons/settings/change_password.svg',
                    ),
                    SettingsTile(
                      onTap: () {
                        GoRouter.of(context).pushNamed(AppRouteNames.twofactor);
                      },
                      title: 'Two-factor authentication',
                      leadingIconPath: 'assets/icons/settings/2factor.svg',
                    ),
                    SettingsTile(
                      title: 'Saved login',
                      leadingIconPath: 'assets/icons/settings/saved_login.svg',
                    ),
                    GlowingDivider(),
                    SizedBox(height: 16.h),

                    sectionHeader('Security checks'),

                    SettingsTile(
                      title: 'Where you’re logged in',
                      leadingIconPath: 'assets/icons/settings/where.svg',
                    ),
                    SettingsTile(
                      title: 'Login alerts',
                      leadingIconPath: 'assets/icons/settings/alert.svg',
                    ),
                    SettingsTile(
                      title: 'Security questions',
                      leadingIconPath:
                          'assets/icons/settings/sec_questions.svg',
                    ),
                    SettingsTile(
                      title: 'Recent emails',
                      leadingIconPath: 'assets/icons/settings/recent_mails.svg',
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
