import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildteamDropdown extends StatefulWidget {
  final List<String> items;
  final ValueNotifier<String?> selectedValueNotifier;
  final String hint;
  final Color? fillColor;
  final Color? borderColor;
  final bool showBorder;

  const BuildteamDropdown({
    super.key,
    required this.items,
    required this.selectedValueNotifier,
    required this.hint,
    this.fillColor,
    this.borderColor,
    this.showBorder = true,
  });

  @override
  State<BuildteamDropdown> createState() => _BuildteamDropdownState();
}

class _BuildteamDropdownState extends State<BuildteamDropdown> {
  @override
  Widget build(BuildContext context) {
    final Color resolvedBorderColor = widget.showBorder
        ? (widget.borderColor ?? Colors.white)
        : Colors.transparent;

    return ValueListenableBuilder<String?>(
      valueListenable: widget.selectedValueNotifier,
      builder: (context, selectedValue, _) {
        return DropdownButtonFormField<String>(
          value: selectedValue,
          isExpanded: true,
          dropdownColor: const Color(0xFF1A1A1A),
          icon: Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 24.sp),
          hint: Text(
            widget.hint,
            style: GoogleFonts.urbanist(
              color: Colors.white.withOpacity(0.6),
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
            filled: true,
            fillColor: widget.fillColor ?? const Color.fromRGBO(33, 36, 38, 1),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: resolvedBorderColor, width: 0.6),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: resolvedBorderColor, width: 0.2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: resolvedBorderColor, width: 0.6),
            ),
          ),
          items: widget.items.map((item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: GoogleFonts.urbanist(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          }).toList(),
          onChanged: (value) {
            widget.selectedValueNotifier.value = value;
          },
          style: GoogleFonts.urbanist(
            color: Colors.white,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        );
      },
    );
  }
}
