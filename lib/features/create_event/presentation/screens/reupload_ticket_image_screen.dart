import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:wei_admin/common_widgets/custom_inner_shadow_button.dart';
import 'package:wei_admin/common_widgets/custom_text.dart';
import 'package:wei_admin/core/app_colors.dart';

class ReuploadTicketImageScreen extends StatelessWidget {
  ReuploadTicketImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 350.w,
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 24.h),
          decoration: BoxDecoration(
            color: AppColors.modalColor,
            borderRadius: BorderRadius.circular(24.r),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 38.h),
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(24.r),
                child: Container(
                  height: 250.w,
                  // width: 155.w,
                  child: Image(
                    image: NetworkImage(
                      "https://images.unsplash.com/photo-1504680177321-2e6a879aac86?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 50.h,

                  decoration: BoxDecoration(
                    color: Color(0xFF606060),
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/icons/common/reupload.svg",
                        height: 20.sp,
                        width: 20.sp,
                      ),
                      SizedBox(width: 4.w),
                      CustomText(
                        text: "Reupload image",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 183.h),

              Row(
                children: [
                  Expanded(
                    child: CustomInnerShadowButton(
                      ontap: () => GoRouter.of(context).pop(),
                      label: "Go back",
                      backgroundColor: AppColors.tertiaryButtonColor,
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: CustomInnerShadowButton(
                      ontap: () => GoRouter.of(context).pop(),
                      label: "Save changes",
                      backgroundColor: AppColors.secondaryButtonColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
