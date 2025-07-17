import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wei_admin/core/app_colors.dart';

class Requiredtext extends StatelessWidget {
  Requiredtext({
    super.key,
    required this.text,
    this.fontFamily = 'Urbanist',
    this.fontSize = 14,
    this.fontColor = AppColors.mainFontColor,
    this.decorationColor = AppColors.mainTheme,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.start,
    this.underline = false,
    this.strike = false,
    this.height = 1,
    this.overflow = TextOverflow.visible,
    this.maxLines,
    this.softWrap = false,
  });

  final String text;
  final String fontFamily;
  final double fontSize;
  Color? fontColor;
  final Color decorationColor;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final bool underline;
  final bool strike;
  final double height;
  final TextOverflow overflow;
  final int? maxLines;
  final bool softWrap;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Text(
            text,
            style: TextStyle(
              fontFamily: fontFamily,
              fontSize: fontSize.sp,
              color: fontColor,
              fontWeight: fontWeight,
              decoration: underline
                  ? TextDecoration.underline
                  : strike
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
              decorationColor: decorationColor,
              decorationThickness: 2.sp,
              height: height.sp,
            ),
            overflow: overflow,
            textAlign: textAlign,
            maxLines: maxLines,
            softWrap: softWrap,
          ),
        ),
        SizedBox(width: 2.w), 
        Text(
          '*',
          style: TextStyle(
            fontFamily: fontFamily,
            fontSize: (fontSize + 2).sp, 
            color: Colors.red,
            fontWeight: fontWeight,
            decoration: underline
                ? TextDecoration.underline
                : strike
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
            decorationColor: decorationColor,
            decorationThickness: 2.sp,
            height: height.sp,
          ),
          overflow: overflow,
          textAlign: textAlign,
          maxLines: maxLines,
        ),
      ],
    );
  }
}
