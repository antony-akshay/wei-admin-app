import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wei_admin/common_widgets/custom_outer_shadow_container.dart';
import 'package:wei_admin/common_widgets/custom_text.dart';
import 'package:wei_admin/core/app_colors.dart';

class LiveEventsTile extends StatelessWidget {
  const LiveEventsTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset("assets/icons/home/live.svg"),
            SizedBox(width: 6.w),
            CustomText(
              text: "LIVE EVENTS",
              fontSize: 16.sp,
              height: 22.sp / 16.sp,
            ),
          ],
        ),
        SizedBox(height: 12.h),
        CustomOuterShadowContainer(
          radius: 24.r,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
            child: Column(
              children: [
                for (int i = 0; i < 3; i++)
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.h),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadiusGeometry.circular(11.r),
                              child: SizedBox(
                                height: 45.w,
                                width: 45.w,
                                child: Image(
                                  image: NetworkImage(
                                    "https://images.unsplash.com/photo-1504680177321-2e6a879aac86?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: 11.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: "Bellie Ellish Concert",
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                                SizedBox(height: 6.h),
                                CustomText(
                                  text: "22 January 2025",
                                  fontSize: 12.sp,
                                  fontColor: AppColors.secondaryFontColor,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                            Spacer(),
                            SvgPicture.asset(
                              "assets/icons/common/menu_dots.svg",
                            ),
                          ],
                        ),
                      ),
                      if (i != 2)
                        Container(
                          height: 1.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Colors.white.withAlpha(0),
                                Colors.white.withAlpha(50),
                                Colors.white.withAlpha(80),
                                Colors.white.withAlpha(150),
                                Colors.white.withAlpha(80),
                                Colors.white.withAlpha(50),
                                Colors.white.withAlpha(0),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
