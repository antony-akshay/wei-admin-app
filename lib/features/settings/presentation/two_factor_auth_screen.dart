import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wei_admin/common_widgets/custom_inner_shadow_icon_button.dart';
import 'package:wei_admin/common_widgets/custom_text.dart';
import 'package:wei_admin/features/profile/widgets/color_button.dart';
import 'package:wei_admin/common_widgets/grey_button.dart';
import 'package:wei_admin/features/settings/widgets/settings_textfield.dart';
import 'package:wei_admin/routes/app_route_constants.dart';

class TwoFactorAuthScreen extends StatelessWidget {
  TwoFactorAuthScreen({super.key});

  final TextEditingController _idController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String? emptyFieldValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This field is required';
    }
    return null;
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
                // Header Row
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
                            'Let’s Confirm It’s Really You',
                            style: GoogleFonts.urbanist(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            'We just need to make sure it’s really you. Complete this quick verification to proceed.',
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

                SizedBox(height: 40),
                CustomText(
                  text: 'Username or email',
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(height: 15),
                SettingsTextfield(
                  controller: _idController,
                  hintText: 'Enter your username or email',
                  validator: emptyFieldValidator,
                ),
                SizedBox(height: 25),
                CustomText(
                  text: 'Password',
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(height: 15),
                ObscureTextField(
                  controller: _pwController,
                  hintText: "Enter your password",
                  validator: emptyFieldValidator,
                  visibleIcon: SvgPicture.asset('assets/icons/settings/pw.svg'),
                  hiddenIcon: SvgPicture.asset('assets/icons/settings/pw.svg'),
                ),

                const Spacer(),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GreyButton(
                      label: 'Back',
                      width: 167,
                      height: 42,
                      onTap: () => Navigator.pop(context),
                    ),
                    ColorButton(
                      label: 'Next',
                      width: 167,
                      height: 42,
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          GoRouter.of(
                            context,
                          ).pushNamed(AppRouteNames.twofactorcodesend);
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
