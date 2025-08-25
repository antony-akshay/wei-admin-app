import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wei_admin/common_widgets/logo_widget.dart';
import 'package:wei_admin/core/app_colors.dart';
import 'package:wei_admin/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:wei_admin/features/auth/presentation/widgets/auth_textfield.dart';
import 'package:wei_admin/features/auth/presentation/widgets/background_gradient.dart';
import 'package:wei_admin/features/auth/presentation/widgets/auth_textfield.dart';
import 'package:wei_admin/features/auth/presentation/widgets/background_gradient.dart';
import 'package:wei_admin/routes/app_route_constants.dart';
import 'package:wei_admin/features/auth/presentation/widgets/auth_button.dart';
import 'package:wei_admin/features/auth/presentation/widgets/form_widget.dart';
import 'package:wei_admin/common_widgets/custom_text.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});

  final TextEditingController _emailOrContactController =
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
                      iconPath: "assets/icons/authentication/password.svg",
                      title: "Forgot your password?",
                      description:
                          "Enter your registered email or phone number below to receive reset instruction.",
                      children: [
                        AuthTextfield(
                          controller: _emailOrContactController,
                          hintText: "Email or contact number",
                          suffixIconPath:
                              "assets/icons/authentication/form_icons/username.svg",
                        ),
                        SizedBox(height: 90.h),
                        BlocConsumer<AuthBloc, AuthState>(
                          listener: (context, state) {
                            if (state is OtpSendSuccessState) {
                              GoRouter.of(
                                context,
                              ).pushNamed(AppRouteNames.otpForgotPassword);
                            } else if(state is OtpSendFailureState){
                              ScaffoldMessenger.of(
                                context,
                              ).showSnackBar(SnackBar(content: Text("OTP did not send")));
                            }
                          },
                          builder: (context, state) {
                            return AuthButton(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  BlocProvider.of<AuthBloc>(context).add(
                                    ForgotPasswordSendclickedEvent(
                                      identifier:
                                          _emailOrContactController.text,
                                    ),
                                  );
                                }
                              },
                              label: "Send",
                              isLoading: state is ForgotPasswordLoadingState,
                            );
                          },
                        ),
                        SizedBox(height: 12.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              text: "Remember password? ",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w200,
                              fontFamily: 'urbanist',
                            ),
                            GestureDetector(
                              onTap: () {
                                GoRouter.of(
                                  context,
                                ).pushNamed(AppRouteNames.login);
                              },
                              child: CustomText(
                                text: "Login",
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
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
