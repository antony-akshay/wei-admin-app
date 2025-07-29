import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wei_admin/core/app_colors.dart';

class CommonFormTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final String? Function(String?)? validator;
  final Widget? suffix;
  final int? maxLines;

  const CommonFormTextfield({
    super.key,
    required this.controller,
    required this.hint,
    this.validator,
    this.suffix, this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      maxLines: maxLines,
      style: const TextStyle(
        color: Colors.white,
        fontFamily: 'Urbanist',
        fontWeight: FontWeight.w500,
        fontSize: 14,
      ),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          color: AppColors.secondaryFontColor,
          fontFamily: 'Urbanist',
          fontWeight: FontWeight.w400,
          fontSize: 14.sp,
        ),
        filled: true,
        fillColor: Colors.transparent,
        contentPadding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 16.h),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.white, width: 0.6),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.white, width: 0.6),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.redAccent),
        ),
        suffixIcon: suffix,
      ),
      validator: validator,
    );
  }
}
