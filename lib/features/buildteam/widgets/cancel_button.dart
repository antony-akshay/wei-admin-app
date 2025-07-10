import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:wei_admin/common_widgets/custom_text.dart';

class CancelButton extends StatelessWidget {
  final String label;
  final bool isLoading;
  final Function()? onTap;

  const CancelButton({
    super.key,
    required this.label,
    this.onTap,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 180.w,
        height: 56.h,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF3A3A50),
              Color(0xFF2B2B3A),
            ],
          ),
          borderRadius: BorderRadius.circular(50.r),
          border: GradientBoxBorder(
            gradient: const LinearGradient(
              colors: [
                Color(0xFF686A8C),
                Color(0xFF3E3F59),
              ],
            ),
            width: 1.2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(100), // 16% opacity
              offset: const Offset(6, 6),
              blurRadius: 12,
            ),
            BoxShadow(
              color: const Color.fromARGB(255, 173, 172, 172).withAlpha(10), // 4% opacity
              offset: const Offset(-6, -6),
              blurRadius: 12,
            ),
          ],
        ),
        child: Center(
          child: isLoading
              ? LoadingAnimationWidget.staggeredDotsWave(
                  color: Colors.white,
                  size: 30.h,
                )
              : CustomText(
                  text: label,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
        ),
      ),
    );
  }
}
