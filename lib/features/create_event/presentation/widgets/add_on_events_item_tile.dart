import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wei_admin/common_widgets/custom_text.dart';
import 'package:wei_admin/core/app_colors.dart';

class AddOnEventsItemTile extends StatelessWidget {
  const AddOnEventsItemTile({super.key, required this.label, this.onTap});
  final String label;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.r),
      child: Material(
        color: AppColors.modalColor,
        child: InkWell(
          onTap: onTap,
          child: Container(
            height: 48.h,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: label, fontSize: 14.sp),
                SvgPicture.asset(
                  "assets/icons/common/add.svg",
                  height: 24.h,
                  width: 24.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
