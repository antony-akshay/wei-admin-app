import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:otp_pin_field/otp_pin_field.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:wei_admin/common_widgets/logo_widget.dart';
import 'package:wei_admin/core/app_colors.dart';
import 'package:wei_admin/core/helpers/app_toast.dart';
import 'package:wei_admin/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:wei_admin/features/auth/presentation/widgets/background_gradient.dart';
import 'package:wei_admin/routes/app_route_constants.dart';
import 'package:wei_admin/features/auth/presentation/widgets/auth_button.dart';
import 'package:wei_admin/features/auth/presentation/widgets/form_widget.dart';
import 'package:wei_admin/common_widgets/custom_text.dart';

class OtpVerificationScreen extends StatelessWidget {
  final String email;
  final String contactNumber;
  OtpVerificationScreen({
    super.key,
    required this.email,
    required this.contactNumber,
  });

  final _formKey = GlobalKey<FormState>();
  final _otpFormKey = GlobalKey<FormState>();
  ValueNotifier isAgreedNotifier = ValueNotifier(false);
  String _otp = "";

  @override
  Widget build(BuildContext context) {
    context.read<AuthBloc>().add(StartTimerEvent(initialDuration: 60));
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
                    BlocConsumer<AuthBloc, AuthState>(
                      buildWhen: (previous, current) =>
                          current is! TimerCountDownState,
                      listener: (context, state) {
                        if (state is OtpVerificationSuccessState) {
                          // just a time delay for showing success widget
                          Future.delayed(Duration(seconds: 1), () {
                            GoRouter.of(
                              context,
                            ).pushReplacementNamed(AppRouteNames.navbarControl);
                          });
                        } else if (state is OtpVerificationFailureState) {
                          AppToast.errorToast(context, state.error);
                        }
                      },
                      builder: (context, state) {
                        log("Rebuild");
                        return FormWidget(
                          formKey: _formKey,

                          successWidget: state is OtpVerificationSuccessState
                              ? Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20.06.w,
                                    vertical: 9.26.h,
                                  ),
                                  height: 54.14.w,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 0.23.w,
                                      color: Colors.white,
                                    ),
                                    borderRadius: BorderRadius.circular(
                                      13.89.r,
                                    ),
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0x4D08AE3A),
                                        Color(0x801E1242),
                                      ],
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        "assets/icons/authentication/success_smiley.svg",
                                      ),
                                      SizedBox(width: 40.w),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CustomText(
                                            text: "Congratulations!",
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          CustomText(
                                            text:
                                                "Your successfully verified your account",
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              : null,
                          iconPath:
                              "assets/icons/authentication/account_verification.svg",
                          title: "Account Verification",
                          description:
                              "Enter the code we sent to your email or phone.",
                          children: [
                            PinCodeTextField(
                              appContext: context,
                              length: 6,
                              keyboardType: TextInputType.number,
                              animationType: AnimationType.fade,
                              hintCharacter: "-",
                              autoFocus: true,
                              cursorColor: Colors.white,
                              textStyle: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              pinTheme: PinTheme(
                                shape: PinCodeFieldShape.box,
                                borderRadius: BorderRadius.circular(8),
                                fieldHeight: 42.w,
                                fieldWidth: 42.w,
                                activeFillColor: Colors.black.withAlpha(102),
                                selectedFillColor: Colors.black.withAlpha(102),
                                inactiveFillColor: AppColors
                                    .authScreenTextfieldBackgroundColor
                                    .withAlpha(102),
                                inactiveColor: Colors.transparent,
                                selectedColor: Colors.transparent,
                                activeColor: Colors.transparent,
                                borderWidth: 2,
                              ),
                              animationDuration: const Duration(
                                milliseconds: 300,
                              ),
                              enableActiveFill: true,
                              onCompleted: (text) {
                                debugPrint("Entered pin is $text");
                                _otp = text;
                              },
                              onChanged: (text) {
                                debugPrint("Changed: $text");
                                _otp = text;
                              },
                            ),
                            SizedBox(height: 16.h),

                            BlocBuilder<AuthBloc, AuthState>(
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
                                  return SizedBox.shrink();
                                }
                              },
                              
                            ),
                            SizedBox(height: 16.h),
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
                                        if (_formKey.currentState!.validate()) {
                                          context.read<AuthBloc>().add(
                                            StartTimerEvent(
                                              initialDuration: 60,
                                            ),
                                          );
                                          context.read<AuthBloc>().add(
                                            VerifyOtpButtonClickedEvent(
                                              email: email,
                                              contactNumber: contactNumber,
                                              otp: _otp,
                                            ),
                                          );
                                        }
                                      },
                                      child: CustomText(
                                        text: "Resend",
                                        fontSize: 14.sp,
                                        fontWeight:
                                            state is TimerCountDownState &&
                                                state.remainingTime == 0
                                            ? FontWeight.w500
                                            : FontWeight.w400,
                                        overflow: TextOverflow.ellipsis,
                                        fontColor:
                                            state is TimerCountDownState &&
                                                state.remainingTime == 0
                                            ? AppColors.mainFontColor
                                            : AppColors.authScreenTextGrey,
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: 24.h),
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
                                  child: AuthButton(
                                    onTap: () {
                                      if (_formKey.currentState!.validate()) {
                                        context.read<AuthBloc>().add(
                                          VerifyOtpButtonClickedEvent(
                                            email: email,
                                            contactNumber: contactNumber,
                                            otp: _otp,
                                          ),
                                        );
                                      }
                                    },
                                    label: "Verify",
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
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
