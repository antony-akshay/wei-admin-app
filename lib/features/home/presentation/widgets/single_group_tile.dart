import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wei_admin/common_widgets/custom_button.dart';
import 'package:wei_admin/common_widgets/custom_outer_shadow_container.dart';
import 'package:wei_admin/common_widgets/custom_text.dart';
import 'package:wei_admin/core/app_colors.dart';

class SingleGroupTile extends StatelessWidget {
  const SingleGroupTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset("assets/icons/home/group.svg"),
            SizedBox(width: 6.w),
            CustomText(
              text: "MY GROUPS",
              fontSize: 16.sp,
              height: 22.sp / 16.sp,
            ),
          ],
        ),
        SizedBox(height: 12.h),
        CustomOuterShadowContainer(
          radius: 24.r,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 16.h),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30.r,
                      backgroundImage: NetworkImage(
                        "https://images.unsplash.com/photo-1554151228-14d9def656e4?q=80&w=1972&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(text: "Lucifer nexus", fontSize: 14.sp),
                        SizedBox(height: 6.h),
                        Row(
                          children: [
                            SizedBox(
                              width: 127.w,
                              child: CustomText(
                                text: "KA, Zayed, Sangeeth, Vishnu",
                                fontSize: 12.sp,
                                fontColor: AppColors.secondaryFontColor,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            CustomText(
                              text: "+2",
                              fontSize: 12.sp,
                              fontColor: AppColors.secondaryFontColor,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    SvgPicture.asset("assets/icons/common/menu_dots.svg"),
                  ],
                ),

                Row(
                  children: [
                    SvgPicture.asset("assets/icons/home/editors.svg"),
                    SizedBox(width: 4.w),
                    CustomText(
                      text: "Editors : 4",
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      fontColor: AppColors.secondaryFontColor,
                    ),
                    Spacer(),

                    SvgPicture.asset("assets/icons/home/collaborators.svg"),
                    SizedBox(width: 4.w),
                    CustomText(
                      text: "Collaborators : 4",
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      fontColor: AppColors.secondaryFontColor,
                    ),
                    Spacer(),

                    SvgPicture.asset("assets/icons/home/coordinators.svg"),
                    SizedBox(width: 4.w),
                    CustomText(
                      text: "Coordinators : 4",
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      fontColor: AppColors.secondaryFontColor,
                    ),
                  ],
                ),

                SizedBox(height: 23.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton(
                      onTap: () {},
                      height: 32.w,
                      width: 96.33.w,
                      text: "View",
                      fontSize: 12.sp,
                      radius: 50.r,
                      backgroundColor: Color(0xFF606060),
                    ),
                    CustomButton(
                      onTap: () {},
                      height: 32.w,
                      width: 96.33.w,
                      text: "Add Member",
                      fontSize: 12.sp,
                      radius: 50.r,
                      backgroundColor: Color(0xFF3EB489),
                    ),
                    CustomButton(
                      onTap: () {},
                      height: 32.w,
                      width: 96.33.w,
                      text: "Create Event",
                      fontSize: 12.sp,
                      radius: 50.r,
                      backgroundColor: AppColors.secondaryButtonColor,
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
