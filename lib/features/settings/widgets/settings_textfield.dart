import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SettingsTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  // final GlobalKey<FormState> formKey;

  const SettingsTextfield({
    super.key,
    required this.controller,
    required this.hintText,
    required this.validator,
    // required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      style: TextStyle(
        color: Colors.white,
        fontFamily: 'Urbanist',
        fontWeight: FontWeight.w500,
        fontSize: 14.sp,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: const Color.fromARGB(161, 208, 208, 208),
          fontFamily: 'Urbanist',
          fontWeight: FontWeight.w400,
          fontSize: 14.sp,
        ),
        filled: true,
        fillColor: const Color.fromRGBO(33, 36, 38, 1),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 18.h,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: Colors.white, width: 0.2.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: Colors.white, width: 0.6.w),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: Colors.red, width: 0.6.w),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: Colors.redAccent, width: 0.6.w),
        ),
      ),
      validator: validator,
    );
  }
}


class ObscureTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  final SvgPicture? visibleIcon; // eye open icon
  final SvgPicture? hiddenIcon;  // eye closed icon

  const ObscureTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.validator,
    this.visibleIcon,
    this.hiddenIcon,
  });

  @override
  State<ObscureTextField> createState() => _ObscureTextFieldState();
}

class _ObscureTextFieldState extends State<ObscureTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: widget.controller,
      obscureText: widget.visibleIcon != null && widget.hiddenIcon != null ? _obscureText : false,
      style: TextStyle(
        color: Colors.white,
        fontFamily: 'Urbanist',
        fontWeight: FontWeight.w500,
        fontSize: 14.sp,
      ),
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: const Color.fromARGB(161, 208, 208, 208),
          fontFamily: 'Urbanist',
          fontWeight: FontWeight.w400,
          fontSize: 14.sp,
        ),
        filled: true,
        fillColor: const Color.fromRGBO(33, 36, 38, 1),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 18.h,
        ),
        suffixIcon: (widget.visibleIcon != null && widget.hiddenIcon != null)
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.all(12.w),
                  child: _obscureText ? widget.visibleIcon! : widget.hiddenIcon!,
                ),
              )
            : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: Colors.white, width: 0.2.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: Colors.white, width: 0.6.w),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: Colors.red, width: 0.6.w),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: Colors.redAccent, width: 0.6.w),
        ),
      ),
      validator: widget.validator,
    );
  }
}
