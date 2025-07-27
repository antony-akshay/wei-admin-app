import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wei_admin/common_widgets/custom_inner_shadow_icon_button.dart';
import 'package:wei_admin/common_widgets/custom_text.dart';
import 'package:wei_admin/features/profile/widgets/color_button.dart';
import 'package:wei_admin/features/profile/widgets/grey_button.dart';
import 'package:wei_admin/features/settings/widgets/settings_textfield.dart';
import 'package:wei_admin/routes/app_route_constants.dart';

class TwoFactorCodeScreen extends StatelessWidget {
  TwoFactorCodeScreen({super.key});

  final TextEditingController _idController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? emptyFieldValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  bool _handleSendTap(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: CustomInnerShadowIconButton(
                        iconPath: "assets/icons/common/arrow_back.svg",
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Let’s Send You a Code',
                            style: GoogleFonts.urbanist(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            'Enter your email or phone number and we’ll send you a quick OTP to verify your identity.',
                            style: GoogleFonts.urbanist(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color.fromRGBO(129, 129, 129, 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40.h),
                CustomText(
                  text: 'Email or phone number',
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(height: 15.h),
                SettingsTextfield(
                  controller: _idController,
                  hintText: 'Enter your email or phone number',
                  validator: emptyFieldValidator,
                ),
                SizedBox(height: 80.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GreyButton(
                      label: 'Back',
                      width: 167,
                      height: 42,
                      onTap: () => Navigator.pop(context),
                    ),
                    ColorButton(
                      label: 'Send',
                      width: 167,
                      height: 42,
                      // onTap: () => _handleSendTap(context),
                      onTap: () {
                        if (_handleSendTap(context)) {
                          GoRouter.of(
                            context,
                          ).pushNamed(AppRouteNames.twofactor);
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
