import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wei_admin/common_widgets/logo_widget.dart';
import 'package:wei_admin/core/app_colors.dart';
import 'package:wei_admin/features/auth/presentation/widgets/auth_textfield.dart';
import 'package:wei_admin/features/auth/presentation/widgets/background_gradient.dart';
import 'package:wei_admin/routes/app_route_constants.dart';
import 'package:wei_admin/features/auth/presentation/widgets/auth_button.dart';
import 'package:wei_admin/features/auth/presentation/widgets/form_widget.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({super.key});

  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmNewPasswordController =
      TextEditingController();
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
          BackgroundGradient(),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: Column(
                  children: [
                    SizedBox(height: 125.h),
                    LogoWidget(),
                    SizedBox(height: 24.h),
                    FormWidget(
                      formKey: _formKey,
                      iconPath:
                          "assets/icons/authentication/reset_password.svg",
                      title: "Reset your password",
                      description:
                          "You can reset your password now and the password must contains 8 characters",
                      children: [
                        AuthTextfield(
                          controller: _newPasswordController,
                          hintText: "New password",
                          suffixIconPath:
                              "assets/icons/authentication/hide_passord.svg",
                          obscureText: true,
                        ),
                        SizedBox(height: 10.h),
                        AuthTextfield(
                          controller: _confirmNewPasswordController,
                          hintText: "Confirm password",
                          suffixIconPath:
                              "assets/icons/authentication/hide_passord.svg",
                          obscureText: true,
                        ),
                        SizedBox(height: 44.h),
                        AuthButton(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {}
                            GoRouter.of(context).pushNamed(AppRouteNames.login);
                          },
                          label: "Save",
                        ),
                        SizedBox(height: 12.h),
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
