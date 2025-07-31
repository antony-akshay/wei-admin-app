import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:wei_admin/core/app_colors.dart';

class CustomOuterShadowContainer extends StatelessWidget {
  const CustomOuterShadowContainer({
    super.key,
    this.height,
    this.width,
    required this.child,
    this.fixedOffset = 6,
    this.radius,
  });

  final double? height;
  final double? width;
  final double? radius;
  final Widget child;
  final double fixedOffset;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      // margin: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(radius ?? 10.r),
        border: GradientBoxBorder(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Color(0xFF343434), Color(0xFF171717)],
          ),
          width: 2.w,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(41),
            offset: Offset(fixedOffset, fixedOffset),
            blurRadius: 12.w,
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Colors.white.withAlpha(10),
            offset: Offset(-fixedOffset, -fixedOffset),
            blurRadius: 12.w,
            spreadRadius: 0,
          ),
        ],
      ),
      alignment: Alignment.center,
      child: child,
    );
  }
}
