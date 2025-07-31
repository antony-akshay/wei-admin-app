import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wei_admin/common_widgets/custom_text.dart';
import 'package:wei_admin/core/app_colors.dart';

class BrowseFilesCard extends StatelessWidget {
  final String title;

  const BrowseFilesCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(text: title, fontSize: 14.sp, fontWeight: FontWeight.w400),
        SizedBox(height: 8.h),
        SizedBox(
          width: 166.w,
          child: DottedBorder(
            options: RoundedRectDottedBorderOptions(
              dashPattern: [10, 5],
              strokeWidth: 0.5.sp,
              radius: Radius.circular(12.r),
              color: AppColors.mainFontColor,
            ),

            child: Container(
              height: 134.h,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    // horizontal: 24.w,
                    vertical: 16.h,
                  ),
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/common/upload.svg",
                        height: 24.sp,
                        width: 24.sp,
                      ),
                      CustomText(
                        text: "Click to upload\nor\nbrowse",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        textAlign: TextAlign.center,
                      ),
                      Spacer(),
                      CustomText(
                        text: "max size 1MB(.png,.jpg)",
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        fontColor: AppColors.secondaryFontColor,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 16.h),
        Container(
          height: 42.h,
          width: 166.w,
          decoration: BoxDecoration(
            color: AppColors.modalColor,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomText(
                  text: "Image.png",
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
                Spacer(),
                Icon(
                  Icons.close_rounded,
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
