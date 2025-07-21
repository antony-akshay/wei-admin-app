import 'package:flutter/material.dart';
import 'package:flutter_inner_shadow/flutter_inner_shadow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:wei_admin/common_widgets/custom_text.dart';
import 'package:wei_admin/core/app_colors.dart';

class CustomInnerShadowButton extends StatelessWidget {
  const CustomInnerShadowButton({
    super.key,
    required this.label,
    required this.backgroundColor,
    this.iconPath,
    this.height,
    this.width,
    this.borderRadius,
    this.ontap,
  });
  final String label;
  final Color backgroundColor;
  final String? iconPath;
  final double? height, width, borderRadius;
  final Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: InnerShadow(
        shadows: [
          BoxShadow(
            color: Colors.white.withAlpha(77),
            offset: Offset(0, 9),
            blurRadius: 14,
            spreadRadius: -5,
          ),
        ],
        child: Container(
          height: height ?? 42.w,
          width: width,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(borderRadius ?? 50.r),
            border: GradientBoxBorder(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.white, Colors.white.withAlpha(0)],
              ),
              width: 0.5.w,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(36),
                offset: Offset(0, 4),
                blurRadius: 6,
              ),
              BoxShadow(
                color: Color(0xFF2B2D43),
                offset: Offset(0, 0),
                blurRadius: 0,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 11.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (iconPath != null) ...[
                  SvgPicture.asset(iconPath!),
                  SizedBox(width: 10.w),
                ],
                CustomText(
                  text: label,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
