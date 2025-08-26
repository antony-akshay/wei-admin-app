import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wei_admin/common_widgets/custom_text.dart';
import 'package:wei_admin/core/app_colors.dart';

class EventPreviewItemTileForImage extends StatelessWidget {
  final String label;
  final String fileName;
  const EventPreviewItemTileForImage({
    super.key,
    required this.label,
    required this.fileName,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
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
        SizedBox(width: 27.w),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 13.h),
            decoration: BoxDecoration(
              color: AppColors.modalColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Expanded(
                  child: CustomText(
                    text: fileName,
                    fontColor: AppColors.mainFontColor,
                    fontSize: 12.sp,
                  ),
                ),
                Icon(
                  Icons.visibility,
                  color: AppColors.mainFontColor,
                  size: 16.sp,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
