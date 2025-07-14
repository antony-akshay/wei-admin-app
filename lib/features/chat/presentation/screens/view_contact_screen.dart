import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wei_admin/common_widgets/custom_inner_shadow_button.dart';
import 'package:wei_admin/common_widgets/custom_inner_shadow_icon_button.dart';
import 'package:wei_admin/common_widgets/custom_text.dart';
import 'package:wei_admin/core/app_colors.dart';

class ViewContactScreen extends StatelessWidget {
  const ViewContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                SizedBox(height: 24.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 11.h),
                      child: CustomInnerShadowIconButton(
                        ontap: () => GoRouter.of(context).pop(),
                        height: 36.w,
                        width: 36.w,
                        iconPath: "assets/icons/common/arrow_back.svg",
                      ),
                    ),
                    Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(50.r),
                          child: SizedBox(
                            height: 90.w,
                            width: 90.w,
                            child: Image(
                              image: NetworkImage(
                                "https://images.unsplash.com/photo-1554151228-14d9def656e4?q=80&w=1972&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 8.h),
                        CustomText(
                          text: "Emma raducanu",
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(height: 4.h),
                        CustomText(
                          text: "@emma_2255",
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          fontColor: AppColors.secondaryFontColor,
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 11.h),
                      child: CustomInnerShadowIconButton(
                        ontap: () {},
                        height: 36.w,
                        width: 36.w,
                        iconPath: "assets/icons/common/menu_dots.svg",
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomInnerShadowButton(
                      label: "Invite as collaborator",
                      backgroundColor: Color(0xFF44444D),
                    ),
                    CustomInnerShadowButton(
                      label: "Invite as coordinator",
                      backgroundColor: Color(0xFF44444D),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
