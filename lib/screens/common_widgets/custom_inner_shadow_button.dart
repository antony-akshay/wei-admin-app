import 'package:flutter/material.dart';
import 'package:flutter_inner_shadow/flutter_inner_shadow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wei_admin/core/app_colors.dart';

class CustomInnerShadowButton extends StatelessWidget {
  const CustomInnerShadowButton({
    super.key,
    required this.iconPath,
    this.height,
    this.width,
    this.borderRadius,
  });
  final String iconPath;
  final double? height;
  final double? width;
  final double? borderRadius;
  @override
  Widget build(BuildContext context) {
    return InnerShadow(
      shadows: [
        BoxShadow(
          color: Colors.black.withAlpha(46),
          offset: Offset(-6, -6),
          blurRadius: 12,
        ),
        BoxShadow(
          color: Colors.white.withAlpha(20),
          offset: Offset(6, 6),
          blurRadius: 12,
        ),
      ],
      child: Container(
        height: height ?? 45.w,
        width: width ?? 45.w,
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius ?? 50.r),
        ),
        child: Center(child: SvgPicture.asset(iconPath)),
      ),
    );
  }
}
