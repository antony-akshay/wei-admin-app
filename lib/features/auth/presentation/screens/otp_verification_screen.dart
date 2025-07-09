import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                          "assets/icons/authentication/account_verification.svg",
                      title: "Account Verification",
                      description:
                          "Enter the code we sent to your email or phone.",
                      children: [
                        OtpPinField(
                          key: _otpFormKey,
                          maxLength: 4,
                          autoFillEnable: true,
                          textInputAction: TextInputAction.done,
                          onSubmit: (text) {
                            debugPrint('Entered pin is $text');
                            _otp = text;
                          },
                          onChange: (text) {
                            debugPrint('Changed: $text');
                            _otp = text;
                          },
                          onCodeChanged: (code) {
                            debugPrint('Code changed: $code');
                            _otp = code;
                          },
                          otpPinFieldStyle: OtpPinFieldStyle(
                            showHintText: true,
                            hintText: "-",
                            hintTextColor: Colors.white,
                            fieldBorderRadius: 8,
                            fieldPadding: 16, // controls size and spacing
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
                          upperChild: const Column(
                            children: [
                              SizedBox(height: 30),
                              Icon(Icons.flutter_dash_outlined, size: 150),
                              SizedBox(height: 20),
                            ],
                          ),

                          mainAxisAlignment: MainAxisAlignment.center,
                          otpPinFieldDecoration: OtpPinFieldDecoration.custom,
                        ),

                        SizedBox(height: 10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              text: "Didn’t receive OTP? ",
                              fontSize: 14.sp,
                              overflow: TextOverflow.ellipsis,
                            ),

                            CustomText(
                              text: "Resend",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              overflow: TextOverflow.ellipsis,
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
                                  borderRadius: BorderRadius.circular(12.r),
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
                                listener: (context, state) {
                                  if (state is OtpVerificationSuccessState) {
                                    GoRouter.of(context).pushReplacementNamed(
                                      AppRouteNames.navbarControl,
                                    );
                                  } else if (state
                                      is OtpVerificationFailureState) {
                                    AppToast.errorToast(context, state.error);
                                  }
                                },
                                builder: (context, state) {
                                  return AuthButton(
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
