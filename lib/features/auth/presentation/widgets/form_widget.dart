import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wei_admin/core/app_colors.dart';
import 'package:wei_admin/common_widgets/custom_text.dart';

class FormWidget extends StatelessWidget {
  final GlobalKey formKey;
  final String iconPath;
  final String title;
  final String description;
  final List<Widget> children;
  const FormWidget({
    super.key,
    required this.formKey,
    required this.iconPath,
    required this.title,
    required this.description,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30.r),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
        child: Container(
          width: 350.w,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white.withAlpha(0), Colors.white.withAlpha(51)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SvgPicture.asset(iconPath),
                  SizedBox(height: 8.h),
                  CustomText(
                    text: title,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(height: 8.h),
                  CustomText(
                    text: description,
                    fontSize: 12.sp,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w400,
                    fontColor: AppColors.authScreenTextGrey,
                  ),
                  SizedBox(height: 16.h),
                  ...children,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
