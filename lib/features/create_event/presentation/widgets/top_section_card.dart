import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wei_admin/common_widgets/custom_text.dart';
import 'package:wei_admin/core/app_colors.dart';

class TopSectionCard extends StatelessWidget {
  const TopSectionCard({
    super.key,
    required this.iconPath,
    required this.progress,
    required this.title,
    required this.description,
  });
  final String iconPath, progress, title, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 64.w,
          width: 64.w,
          decoration: BoxDecoration(
            color: AppColors.modalColor,
            borderRadius: BorderRadius.circular(60.r),
          ),
          child: Center(
            child: SvgPicture.asset(iconPath, height: 24.w, width: 24.w),
          ),
        ),
        SizedBox(height: 7.h),
        CustomText(
          text: progress,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          fontColor: AppColors.secondaryFontColor,
        ),
        SizedBox(height: 16.h),
        CustomText(text: title, fontSize: 18.sp, fontWeight: FontWeight.w600),
        SizedBox(height: 4.h),
        CustomText(
          text: description,
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          fontColor: AppColors.secondaryFontColor,
        ),
      ],
    );
  }
}
