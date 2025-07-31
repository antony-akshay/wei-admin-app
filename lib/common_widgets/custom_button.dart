import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:wei_admin/core/app_colors.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    Key? key,
    this.width,
    this.height,
    required this.onTap,
    required this.text,
    this.backgroundColor,
    this.isLoading,
    this.fontSize,
    this.radius,
    this.fontColor,
  });
  final double? height, width;
  final String text;
  final Function()? onTap;
  final Color? backgroundColor;
  final Color? fontColor;
  bool? isLoading = false;
  final double? fontSize;
  final double? radius;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      minWidth: width ?? double.infinity,
      height: height ?? 50.h,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius ?? 6),
      ),
      color: backgroundColor ?? AppColors.secondaryButtonColor,
      child: isLoading == true
          ? SizedBox(
              width: 25.h,
              height: 25.h,
              child: LoadingAnimationWidget.staggeredDotsWave(
                color: AppColors.mainFontColor,
                size: 20.h,
              ),
            )
          : CustomText(
              text: text,
              fontSize: fontSize ?? 14.sp,
              fontWeight: FontWeight.w600,
              fontColor: fontColor ?? AppColors.mainFontColor,
            ),
    );
  }
}
