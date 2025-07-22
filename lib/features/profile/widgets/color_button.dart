import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:wei_admin/common_widgets/custom_text.dart';

class ColorButton extends StatelessWidget {
  final String label;
  final bool isLoading;
  final Function()? onTap;

  // Optional size and text customization
  final double? height;
  final double? width;
  final double? textSize;
  final Color? textColor;
  final FontWeight? textWeight;
  final String? textFamily;

  const ColorButton({
    super.key,
    required this.label,
    this.onTap,
    this.isLoading = false,
    this.height,
    this.width,
    this.textSize,
    this.textColor,
    this.textWeight,
    this.textFamily,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onTap,
      child: Container(
        height: height ?? 42.w,
        width: width ?? 167.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(33.r),
          border: GradientBoxBorder(
            gradient: const LinearGradient(
              colors: [
                Color.fromARGB(228, 92, 80, 254),
                Color(0xFF8B6EF2),
              ],
            ),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(100),
              offset: const Offset(6, 6),
              blurRadius: 12,
            ),
            BoxShadow(
              color: Colors.white.withAlpha(10),
              offset: const Offset(-6, -6),
              blurRadius: 12,
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color.fromARGB(255, 162, 137, 254),
                Color.fromARGB(228, 92, 80, 254),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(33.r),
          ),
          child: Center(
            child: isLoading
                ? LoadingAnimationWidget.staggeredDotsWave(
                    color: Colors.white,
                    size: 30.h,
                  )
                : CustomText(
                    text: label,
                    fontSize: textSize ?? 12.sp,
                    fontColor: textColor ?? Colors.white,
                    fontWeight: textWeight ?? FontWeight.w500,
                    fontFamily: textFamily ?? 'Urbanist',
                  ),
          ),
        ),
      ),
    );
  }
}
