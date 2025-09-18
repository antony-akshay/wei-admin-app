import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:otp_pin_field/otp_pin_field.dart';
import 'package:wei_admin/common_widgets/logo_widget.dart';
import 'package:wei_admin/core/app_colors.dart';
import 'package:wei_admin/core/helpers/app_toast.dart';
import 'package:wei_admin/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:wei_admin/features/auth/presentation/screens/reset_password_screen.dart';
import 'package:wei_admin/features/auth/presentation/widgets/background_gradient.dart';
import 'package:wei_admin/routes/app_route_constants.dart';
import 'package:wei_admin/features/auth/presentation/widgets/auth_button.dart';
import 'package:wei_admin/features/auth/presentation/widgets/form_widget.dart';
import 'package:wei_admin/common_widgets/custom_text.dart';

class OtpForgotPasswordScreen extends StatelessWidget {
  OtpForgotPasswordScreen({super.key, required this.email});

  final String email;

  final _formKey = GlobalKey<FormState>();
  final _otpFormKey = GlobalKey<FormState>();
  String _otp = "";

  @override
  Widget build(BuildContext context) {
    // start the countdown immediately when screen opens
    context.read<AuthBloc>().add(StartTimerEvent(initialDuration: 10));

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: const Image(
              image: AssetImage("assets/images/authentication_background.png"),
              fit: BoxFit.cover,
            ),
          ),
          BackgroundGradient(),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
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
                          "assets/icons/authentication/account_verification.svg",
                      title: "OTP Verification",
                      description:
                          "Enter the code we sent to your email or phone.",
                      children: [
                        OtpPinField(
                          key: _otpFormKey,
                          maxLength: 6,
                          autoFillEnable: true,
                          textInputAction: TextInputAction.done,
                          onSubmit: (text) {
                            _otp = text;
                            BlocProvider.of<AuthBloc>(context).add(
                              OtpVerifyButtonClickedEvent(
                                email: email,
                                pin: text,
                              ),
                            );
                          },
                          onChange: (text) {
                            _otp = text;
                          },
                          otpPinFieldStyle: OtpPinFieldStyle(
                            showHintText: true,
                            hintText: "-",
                            hintTextColor: Colors.white,
                            fieldBorderRadius: 8,
                            fieldPadding: 16,
                            fieldBorderWidth: 2,
                            defaultFieldBackgroundColor: AppColors
                                .authScreenTextfieldBackgroundColor
                                .withAlpha(102),
                            activeFieldBackgroundColor: Colors.black.withAlpha(
                              102,
                            ),
                            filledFieldBackgroundColor: Colors.black.withAlpha(
                              102,
                            ),
                            defaultFieldBorderColor: Colors.transparent,
                            activeFieldBorderColor: Colors.transparent,
                            filledFieldBorderColor: Colors.transparent,
                            textStyle: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          showCursor: true,
                          cursorColor: Colors.white,
                          cursorWidth: 2,
                          mainAxisAlignment: MainAxisAlignment.center,
                          otpPinFieldDecoration: OtpPinFieldDecoration.custom,
                        ),

                        SizedBox(height: 16.h),

                        // Countdown Timer + Expiry Toast
                        // Countdown Timer + Expiry Toast
                        BlocListener<AuthBloc, AuthState>(
                          listenWhen: (previous, current) =>
                              current is TimerCountDownState,
                          listener: (context, state) {
                            if (state is TimerCountDownState &&
                                state.remainingTime == 0) {
                              print(
                                "state.remainingTime:${state.remainingTime}",
                              );

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("otp expired try resending..."),
                                ),
                              );
                            }
                          },
                          child: BlocBuilder<AuthBloc, AuthState>(
                            buildWhen: (previous, current) =>
                                current is TimerCountDownState,
                            builder: (context, state) {
                              if (state is TimerCountDownState &&
                                  state.remainingTime != 0) {
                                return CustomText(
                                  text: "${state.remainingTime}s",
                                  fontSize: 14.sp,
                                  overflow: TextOverflow.ellipsis,
                                );
                              } else {
                                return const SizedBox.shrink();
                              }
                            },
                          ),
                        ),

                        SizedBox(height: 16.h),

                        // Resend OTP
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              text: "Didn’t receive OTP? ",
                              fontSize: 14.sp,
                              overflow: TextOverflow.ellipsis,
                            ),
                            BlocBuilder<AuthBloc, AuthState>(
                              buildWhen: (previous, current) =>
                                  current is TimerCountDownState,
                              builder: (context, state) {
                                return GestureDetector(
                                  onTap: () {
                                    if (state is TimerCountDownState &&
                                        state.remainingTime == 0) {
                                      // restart timer
                                      context.read<AuthBloc>().add(
                                        StartTimerEvent(initialDuration: 30),
                                      );
                                      // resend OTP event
                                      // context.read<AuthBloc>().add(
                                      //   OtpResendButtonClickedEvent(
                                      //     email: email,
                                      //   ),
                                      // );
                                    }
                                  },
                                  child: CustomText(
                                    text: "Resend",
                                    fontSize: 14.sp,
                                    fontWeight:
                                        (state is TimerCountDownState &&
                                            state.remainingTime == 0)
                                        ? FontWeight.w500
                                        : FontWeight.w400,
                                    overflow: TextOverflow.ellipsis,
                                    fontColor:
                                        (state is TimerCountDownState &&
                                            state.remainingTime == 0)
                                        ? AppColors.mainFontColor
                                        : AppColors.authScreenTextGrey,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),

                        SizedBox(height: 24.h),

                        // Buttons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () => context.pop(),
                              child: Container(
                                height: 48.w,
                                width: 153.w,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 0.4.w,
                                    color: AppColors.mainFontColor,
                                  ),
                                  borderRadius: BorderRadius.circular(41.r),
                                ),
                                child: Center(
                                  child: CustomText(
                                    text: "Go Back",
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 153.w,
                              child: BlocConsumer<AuthBloc, AuthState>(
                                buildWhen: (previous, current) =>
                                    current is! TimerCountDownState,
                                listener: (context, state) {
                                  if (state is OtpVerificationSuccessState) {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ResetPasswordScreen(),
                                      ),
                                    );
                                  } else if (state
                                      is OtpVerificationFailureState) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          "OTP verification failed",
                                        ),
                                      ),
                                    );
                                  }
                                },
                                builder: (context, state) {
                                  return AuthButton(
                                    onTap: () {
                                      if (_formKey.currentState!.validate()) {
                                        context.read<AuthBloc>().add(
                                          OtpVerifyButtonClickedEvent(
                                            email: email,
                                            pin: _otp,
                                          ),
                                        );
                                      }
                                    },
                                    label: "Verify",
                                    isLoading: state is AuthLoadingState,
                                  );
                                },
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
