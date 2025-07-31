import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wei_admin/common_widgets/custom_text.dart';
import 'package:wei_admin/core/app_colors.dart';

class MembersListTile extends StatelessWidget {
  const MembersListTile({super.key, required this.member});
  final member;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(30.w),
          child: SizedBox(
            height: 50.w,
            width: 50.w,
            child: Image(
              image: NetworkImage(member["profilePic"]),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 10.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: member["name"],
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: 4.h),
            CustomText(
              text: member["username"],
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              fontColor: AppColors.secondaryFontColor,
            ),
          ],
        ),
        Spacer(),
        Container(
          height: 28.h,
          decoration: BoxDecoration(
            color: Color(0xFF383838),
            borderRadius: BorderRadius.circular(50.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w),
            child: Center(
              child: CustomText(
                text: member["type"],
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
