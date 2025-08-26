import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wei_admin/common_widgets/custom_outer_shadow_container.dart';
import 'package:wei_admin/common_widgets/custom_text.dart';
import 'package:wei_admin/core/app_colors.dart';
import 'package:wei_admin/routes/app_route_constants.dart';

class WelcomeTile extends StatelessWidget {
  const WelcomeTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          text: "Welcome to",
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          fontColor: AppColors.secondaryFontColor,
        ),
        SizedBox(height: 12.h),
        CustomText(
          text: "Wie events ",
          fontSize: 28.sp,
          fontWeight: FontWeight.w600,
          fontColor: AppColors.secondaryFontColor,
        ),
        SizedBox(height: 12.h),
        CustomText(
          text:
              "Got an idea? Let’s make it official! Set up your event and share it with the world.",
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          fontColor: AppColors.secondaryFontColor,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 12.h),
        GestureDetector(
          onTap: () => GoRouter.of(context).pushNamed(AppRouteNames.buildTeam1),
          child: CustomOuterShadowContainer(
            height: 49.w,
            width: 174.w,
            radius: 100.r,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 12.w),
              child: CustomText(text: "Create event"),
            ),
          ),
        ),
      ],
    );
  }
}
