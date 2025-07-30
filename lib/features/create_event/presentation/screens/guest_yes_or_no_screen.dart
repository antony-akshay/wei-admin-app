import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wei_admin/common_widgets/custom_inner_shadow_button.dart';
import 'package:wei_admin/common_widgets/custom_text.dart';
import 'package:wei_admin/core/app_colors.dart';
import 'package:wei_admin/routes/app_route_constants.dart';

class GuestYesOrNoScreen extends StatelessWidget {
  const GuestYesOrNoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Center(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.modalColor,
              borderRadius: BorderRadius.circular(24.r),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 25.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomText(
                    text: "Do You Have any Guest for This Event?",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(height: 8.h),
                  CustomText(
                    text:
                        "Let us know if you're inviting any special guest, speaker, or performer to this event.",
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.center,
                    fontColor: AppColors.secondaryFontColor,
                  ),
                  SizedBox(height: 100.h),
                  Row(
                    children: [
                      Expanded(
                        child: CustomInnerShadowButton(
                          label: "No",
                          backgroundColor: AppColors.tertiaryButtonColor,
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Expanded(
                        child: CustomInnerShadowButton(
                          ontap: () => GoRouter.of(
                            context,
                          ).pushNamed(AppRouteNames.guestDetailsAdding),
                          label: "Yes",
                          backgroundColor: AppColors.secondaryButtonColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
