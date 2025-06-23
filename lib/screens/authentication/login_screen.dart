import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wei_admin/core/app_colors.dart';
import 'package:wei_admin/screens/authentication/widgets/auth_button.dart';
import 'package:wei_admin/screens/authentication/widgets/auth_textfield.dart';
import 'package:wei_admin/screens/authentication/widgets/form_widget.dart';
import 'package:wei_admin/screens/common_widgets/custom_text.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  ValueNotifier isAgreedNotifier = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Image(
              image: AssetImage("assets/images/authentication_background.png"),
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 226.h,
            left: 0,
            right: 0,
            child: Center(
              child: Column(
                children: [
                  FormWidget(
                    formKey: _formKey,
                    iconPath: "assets/icons/authentication/person.svg",
                    title: "Login",
                    description:
                        "Log in to continue managing your events, your team, and your success.",
                    children: [
                      AuthTextfield(
                        controller: _usernameController,
                        hintText: "Username, Email, or contact number",
                      ),
                      SizedBox(height: 10.h),
                      AuthTextfield(
                        controller: _passwordController,
                        hintText: "Password",
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          SizedBox(
                            height: 18.w,
                            width: 18.w,
                            child: ValueListenableBuilder(
                              valueListenable: isAgreedNotifier,
                              builder: (context, isAgeed, _) {
                                return Checkbox(
                                  value: isAgeed,
                                  onChanged: (value) {
                                    isAgreedNotifier.value = value;
                                  },
                                  visualDensity: VisualDensity.compact,
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  checkColor: AppColors.mainTheme,
                                  fillColor: WidgetStateProperty.resolveWith((
                                    states,
                                  ) {
                                    if (states.contains(WidgetState.selected)) {
                                      return Colors.white;
                                    }
                                    return Colors.transparent;
                                  }),
                                );
                              },
                            ),
                          ),
                          SizedBox(width: 8.w),
                          CustomText(
                            text:
                                "I agree to the Terms of Services and Privacy Policy",
                            fontSize: 12.sp,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      SizedBox(height: 24.h),
                      AuthButton(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {}
                        },
                        label: "Login",
                      ),
                      SizedBox(height: 12.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            text: "Already have an account? ",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          GestureDetector(
                            child: CustomText(
                              text: "Login",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
