import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wei_admin/core/app_colors.dart';
import 'package:wei_admin/routes/app_route_constants.dart';
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
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: Column(
                  children: [
                    SizedBox(height: 200.h),
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
                          suffixIconPath:
                              "assets/icons/authentication/form_icons/username.svg",
                        ),
                        SizedBox(height: 10.h),
                        AuthTextfield(
                          controller: _passwordController,
                          hintText: "Password",
                          suffixIconPath:
                              "assets/icons/authentication/form_icons/password.svg",
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
                                      if (states.contains(
                                        WidgetState.selected,
                                      )) {
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
                              text: "Remember me",
                              fontSize: 12.sp,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Spacer(),
                            CustomText(
                              text: "Forgot password",
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
                              text: "Don't have an account? ",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            GestureDetector(
                              onTap: () {
                                GoRouter.of(
                                  context,
                                ).pushNamed(AppRouteConstants.adminSignup);
                                // GoRouter.of(context).pushNamed(
                                //   AppRouteConstants.organizationSignup,
                                // );
                              },
                              child: CustomText(
                                text: "Signup",
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
          ),
        ],
      ),
    );
  }
}
