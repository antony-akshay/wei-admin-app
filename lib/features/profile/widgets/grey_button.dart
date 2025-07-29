import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:wei_admin/common_widgets/custom_text.dart';

class GreyButton extends StatelessWidget {
  final String label;
  final double width;
  final double height;
  final bool isLoading;
  final Function()? onTap;

  const GreyButton({
    super.key,
    required this.label,
    required this.width,
    required this.height,
    this.isLoading = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onTap,
      child: Container(
        width: width.w,
        height: height.h,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 118, 117, 117), // Top
              Color.fromARGB(244, 46, 46, 46),    // Bottom
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(33.r),
          border: GradientBoxBorder(
            gradient: const LinearGradient(
              colors: [Color(0xFF3E3E3E), Color(0xFF262626)],
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
              color: Colors.white.withAlpha(20),
              offset: const Offset(-6, -6),
              blurRadius: 12,
            ),
          ],
        ),
        child: Center(
          child: isLoading
              ? LoadingAnimationWidget.staggeredDotsWave(
                  color: Colors.white,
                  size: 28.sp,
                )
              : CustomText(
                  text: label,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  fontColor: Colors.white,
                ),
        ),
      ),
    );
  }
}
