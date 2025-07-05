import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:wei_admin/screens/common_widgets/custom_text.dart';

class AuthButton extends StatelessWidget {
  final String label;
  final Function()? onTap;

  const AuthButton({super.key, required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48.w,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color(0xFF1E1242), 
              Color(0xFF65498B), 
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(33.r),
          border: GradientBoxBorder(
            gradient: LinearGradient(
              colors: [
                Color(0xFF1E12).withAlpha(51),
                Color(0xFF5D5D5D).withAlpha(51),
              ],
            ),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(41), // 16% opacity
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
          child: CustomText(
            text: label,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
