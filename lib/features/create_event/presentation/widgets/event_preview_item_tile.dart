import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wei_admin/common_widgets/custom_text.dart';
import 'package:wei_admin/core/app_colors.dart';

class EventPreviewItemTile extends StatelessWidget {
  final String label;
  final String value;
  const EventPreviewItemTile({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
          decoration: BoxDecoration(
            color: AppColors.modalColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: CustomText(
            text: label,
            fontColor: AppColors.mainFontColor,
            fontSize: 12.sp,
          ),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: CustomText(
            text: value,
            fontColor: AppColors.mainFontColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
