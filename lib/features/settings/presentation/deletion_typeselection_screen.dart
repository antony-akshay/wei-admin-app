import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wei_admin/common_widgets/custom_inner_shadow_icon_button.dart';
import 'package:wei_admin/common_widgets/grey_button.dart';
import 'package:wei_admin/features/profile/widgets/color_button.dart';
import 'package:wei_admin/routes/app_route_constants.dart';

class DeletionTypeselectionScreen extends StatefulWidget {
  const DeletionTypeselectionScreen({super.key});

  @override
  State<DeletionTypeselectionScreen> createState() =>
      _DeletionTypeselectionScreenState();
}

class _DeletionTypeselectionScreenState
    extends State<DeletionTypeselectionScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const CustomInnerShadowIconButton(
                      iconPath: "assets/icons/common/arrow_back.svg",
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Account deactivation options',
                          style: GoogleFonts.urbanist(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          'Choose how you want to deactivate your account',
                          style: GoogleFonts.urbanist(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(129, 129, 129, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20.h),
            RadioOptionTile(
              title: "Temporary Deactivation",
              subtitle:
                  "Temporarily disable your account. Reactivate anytime by logging in.",
              selected: selectedIndex == 0,
              onTap: () => setState(() => selectedIndex = 0),
            ),
            RadioOptionTile(
              title: "Permanent Deletion",
              subtitle:
                  "Permanently delete your account and all data. This action is irreversible.",
              selected: selectedIndex == 1,
              onTap: () => setState(() => selectedIndex = 1),
            ),

            const Spacer(),
            Padding(
              padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 26.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GreyButton(
                    label: 'Back',
                    width: 167.w,
                    height: 42.h,
                    onTap: () => Navigator.pop(context),
                  ),
                  ColorButton(
                    label: 'Next',
                    width: 167.w,
                    height: 42.h,
                    onTap: () {
                      if (selectedIndex == 0) {
                        GoRouter.of(
                          context,
                        ).pushNamed(AppRouteNames.temporary_delete);
                      } else {
                        GoRouter.of(
                          context,
                        ).pushNamed(AppRouteNames.permanent_delete);
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RadioOptionTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool selected;
  final VoidCallback onTap;

  const RadioOptionTile({
    super.key,
    required this.title,
    this.subtitle,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text part
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.urbanist(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  if (subtitle != null)
                    Padding(
                      padding: EdgeInsets.only(top: 2.h),
                      child: Text(
                        subtitle!,
                        style: GoogleFonts.urbanist(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[400],
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Container(
              width: 20.w,
              height: 20.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: selected
                      ? Color.fromRGBO(36, 156, 255, 1)
                      : Colors.white,
                  width: 2,
                ),
              ),
              child: selected
                  ? Center(
                      child: Container(
                        width: 10.w,
                        height: 10.w,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(36, 156, 255, 1),
                          shape: BoxShape.circle,
                        ),
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
