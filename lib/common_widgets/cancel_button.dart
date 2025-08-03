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
        height: 42.w,
        width: 167.w,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 118, 117, 117), // Dark gray
              Color.fromARGB(157, 46, 46, 46), // Darker gray
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(33.r),
          border: GradientBoxBorder(
            gradient: LinearGradient(
              colors: [Color(0xFF3E3E3E), Color(0xFF262626)],
            ),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(100), // 16% opacity
              offset: const Offset(6, 6),
              blurRadius: 12,
            ),
            BoxShadow(
              color: Colors.white.withAlpha(10), // 4% opacity
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
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
        ),
      ),
    );
  }
}