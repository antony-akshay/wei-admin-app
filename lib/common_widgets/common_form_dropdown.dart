import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wei_admin/common_widgets/custom_text.dart';
import 'package:wei_admin/core/app_colors.dart';

class CommonFormDropdown extends StatelessWidget {
  final String hint;
  final List<String> items;
  final ValueNotifier<String?> selectedValueNotifier;
  final String? Function(String?)? validator;

  const CommonFormDropdown({
    super.key,
    required this.hint,
    required this.items,
    required this.selectedValueNotifier,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String?>(
      valueListenable: selectedValueNotifier,
      builder: (context, selectedValue, _) {
        return DropdownButtonFormField<String>(
          value: selectedValue,
          isExpanded: true,
          dropdownColor: const Color(0xFF1A1A1A),
          icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white),

          hint: CustomText(
            text: hint,
            fontSize: 14.sp,
            fontColor: AppColors.secondaryFontColor,
          ),

          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 16.h,
            ),
            filled: true,
            fillColor: Colors.transparent,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 255, 255, 255),
                width: 0.6,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 255, 255, 255),
                width: 0.6,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.white, width: 0.6),
            ),
          ),

          items: items.map((item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: GoogleFonts.urbanist(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          }).toList(),

          onChanged: (value) {
            selectedValueNotifier.value = value;
            FormState? form = Form.maybeOf(context);
            form?.validate(); // if (validator != null) {
            validator!(value);
            // }
          },

          validator:
              validator ??
              (value) {
                if (value == null || value.isEmpty) {
                  return '$hint is required';
                }
              },

          style: GoogleFonts.urbanist(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        );
      },
    );
  }
}
