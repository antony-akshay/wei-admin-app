import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wei_admin/common_widgets/custom_inner_shadow_icon_button.dart';
import 'package:wei_admin/common_widgets/custom_text.dart';
import 'package:wei_admin/features/profile/widgets/color_button.dart';
import 'package:wei_admin/features/profile/widgets/grey_button.dart';
import 'package:wei_admin/features/settings/widgets/settings_textfield.dart';

class ChangePwScreen extends StatelessWidget {
  ChangePwScreen({super.key});

  TextEditingController _currentpwController = TextEditingController();
  TextEditingController _newpwController = TextEditingController();
  TextEditingController _renewpwController = TextEditingController();

  String? passwordValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This field is required';
    }

    String password = value.trim();

    final bool hasUppercase = password.contains(RegExp(r'[A-Z]'));
    final bool hasLowercase = password.contains(RegExp(r'[a-z]'));
    final bool hasMinLength = password.length >= 8;
    final bool hasSpecialChar = password.contains(
      RegExp(r'[!@#$%^&*(),.?":{}|<>]'),
    );

    if (!hasUppercase) return 'Must include at least one uppercase letter';
    if (!hasLowercase) return 'Must include at least one lowercase letter';
    if (!hasMinLength) return 'Must be at least 8 characters long';
    if (!hasSpecialChar) return 'Must include at least one special symbol';

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomInnerShadowIconButton(
                    iconPath: "assets/icons/common/arrow_back.svg",
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Change password',
                          style: GoogleFonts.urbanist(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          'Choose a new password to enhance your account’s protection.',
                          style: GoogleFonts.urbanist(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(129, 129, 129, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              CustomText(
                text: 'Current password',
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(height: 15),
              ObscureTextField(
                controller: _currentpwController,
                hintText: "Enter your password",
                validator: passwordValidator,
                visibleIcon: SvgPicture.asset('assets/icons/settings/pw.svg'),
                hiddenIcon: SvgPicture.asset('assets/icons/settings/pw.svg'),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomText(
                    text: 'Forgot password?',
                    fontColor: Color.fromRGBO(129, 129, 129, 1),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
              SizedBox(height: 40),
              CustomText(
                text: 'New password',
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(height: 15),
              ObscureTextField(
                controller: _newpwController,
                hintText: "Enter new your password",
                validator: passwordValidator,
                visibleIcon: SvgPicture.asset('assets/icons/settings/pw.svg'),
                hiddenIcon: SvgPicture.asset('assets/icons/settings/pw.svg'),
              ),
              SizedBox(height: 25),
              CustomText(
                text: 'Confirm password',
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(height: 15),
              ObscureTextField(
                controller: _renewpwController,
                hintText: "Re-enter your password",
                validator: passwordValidator,
                visibleIcon: SvgPicture.asset('assets/icons/settings/pw.svg'),
                hiddenIcon: SvgPicture.asset('assets/icons/settings/pw.svg'),
              ),
              SizedBox(height: 60),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GreyButton(label: 'Cancel', width: 167, height: 42),
                      ColorButton(label: 'Save', height: 42, width: 167),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
