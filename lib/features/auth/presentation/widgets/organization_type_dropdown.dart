import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wei_admin/common_widgets/custom_text.dart';
import 'package:wei_admin/core/app_colors.dart';

class OrganizationTypeDropdown extends StatelessWidget {
  final String? selectedValue;
  final String? label;
  final ValueChanged<String?>? onChanged;
  final String? Function(String?)? validator;

  // Hardcoded list of organization types
  static const List<String> organizationTypes = [
    'Corporation',
    'Limited Liability Company (LLC)',
    'Partnership',
    'Sole Proprietorship',
    'Non-Profit Organization',
    'Government Agency',
    'Educational Institution',
    'Healthcare Organization',
    'Financial Institution',
    'Technology Company',
    'Manufacturing Company',
    'Retail Business',
    'Consulting Firm',
    'Startup',
    'Other',
    'NGO',
  ];

  const OrganizationTypeDropdown({
    super.key,
    this.selectedValue,
    this.label,
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 48.h,
      child: DropdownButtonFormField<String>(
        value: selectedValue,
        onChanged: onChanged,
        validator:
            validator ??
            (value) {
              if (value == null || value.isEmpty) {
                return 'Type of organization is required';
              }
              return null;
            },
        style: TextStyle(
          fontFamily: 'Urbanist',
          fontWeight: FontWeight.w500,
          fontSize: 12.sp,
          color: Colors.white,
        ),
        dropdownColor: AppColors.authScreenTextfieldBackgroundColor,
        decoration: InputDecoration(
          labelText: label,
          errorStyle: TextStyle(height: 0),
          // hintText: "Organization",
          // hintStyle: TextStyle(
          //   fontFamily: 'Urbanist',
          //   fontWeight: FontWeight.w400,
          //   fontSize: 12.sp,
          //   color: Color(0xFFD0D0D0),
          // ),
          hint: Padding(
            padding: EdgeInsets.only(bottom: 2.h),
            child: CustomText(
              text: "Type of organization",
              fontWeight: FontWeight.w400,
              fontSize: 12.sp,
              fontColor: Color(0xFFD0D0D0),
            ),
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
              "assets/icons/authentication/form_icons/dropdown_arrow.svg",
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
        icon:
            SizedBox.shrink(), // Hide default dropdown arrow since we're using custom suffix icon
        items: organizationTypes.map((String type) {
          return DropdownMenuItem<String>(
            value: type,
            child: Text(
              type,
              style: TextStyle(
                fontFamily: 'Urbanist',
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
                color: Colors.white,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
