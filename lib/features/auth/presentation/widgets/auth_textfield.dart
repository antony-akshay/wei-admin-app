import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wei_admin/core/app_colors.dart';

class AuthTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String? label;
  final String hintText;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final String suffixIconPath;

  const AuthTextfield({
    super.key,
    required this.controller,
    required this.hintText,
    required this.suffixIconPath,
    this.label,
    this.obscureText,
    this.keyboardType,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          // height: 48.h,
          child: TextFormField(
            controller: controller,
            obscureText: obscureText ?? false,
            keyboardType: keyboardType,
            validator:
                validator ??
                (value) {
                  if (value == null || value.isEmpty) {
                    return '$hintText is required';
                  }
                  return null;
                },
            style: TextStyle(
              fontFamily: 'Urbanist',
              fontWeight: FontWeight.w500,
              fontSize: 12.sp,
              color: Colors.white,
            ),
            decoration: InputDecoration(
              labelText: label,
              hintText: hintText,
              errorStyle: TextStyle(height: 0),
              hintStyle: TextStyle(
                fontFamily: 'Urbanist',
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
                color: Color(0xFFD0D0D0),
              ),
              filled: true,
              fillColor: AppColors.authScreenTextfieldBackgroundColor.withAlpha(
                102,
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 16.h,
              ),

              suffixIcon: Padding(
                padding: EdgeInsets.only(right: 15.w),
                child: SvgPicture.asset(
                  suffixIconPath,
                  height: 16.w,
                  width: 16.w,
                ),
              ),
              suffixIconConstraints: BoxConstraints(
                maxHeight: 32.w,
                maxWidth: 32.w,
              ),

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide.none,
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(color: Colors.red),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
