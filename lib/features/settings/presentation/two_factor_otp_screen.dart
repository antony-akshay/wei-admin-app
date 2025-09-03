import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wei_admin/common_widgets/custom_inner_shadow_icon_button.dart';
import 'package:wei_admin/common_widgets/custom_text.dart';
import 'package:wei_admin/features/profile/widgets/color_button.dart';
import 'package:wei_admin/common_widgets/grey_button.dart';
import 'package:wei_admin/routes/app_route_constants.dart';

class TwoFactorOtpScreen extends StatefulWidget {
  const TwoFactorOtpScreen({super.key});

  @override
  State<TwoFactorOtpScreen> createState() => _OTPInputScreenState();
}

class _OTPInputScreenState extends State<TwoFactorOtpScreen> {
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());
  final List<TextEditingController> _controllers = List.generate(
    4,
    (_) => TextEditingController(),
  );
  late String otp ;

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  Widget _buildOTPBox(int index) {
    return SizedBox(
      width: 46,
      height: 46,
      child: TextFormField(
        controller: _controllers[index],
        focusNode: _focusNodes[index],
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        style: const TextStyle(fontSize: 16, color: Colors.white),
        maxLength: 1,
        onChanged: (value) {
          if (value.isNotEmpty && index < 3) {
            _focusNodes[index + 1].requestFocus();
          } else if (value.isEmpty && index > 0) {
            _focusNodes[index - 1].requestFocus();
          }
        },
        decoration: InputDecoration(
          hintText: '-',
          counterText: '',
          filled: true,
          fillColor: const Color.fromARGB(56, 63, 63, 61),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        child: Column(
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
                        'Check Your Inbox!',
                        style: GoogleFonts.urbanist(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        'We’ve sent you a 4-digit code — enter it here to verify your identity and move forward.',
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
            SizedBox(height: 90),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                4,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 13.0),
                  child: _buildOTPBox(index),
                ),
              ),
            ),
            SizedBox(height: 50),
            GestureDetector(
              onTap: () {},
              child: CustomText(text: 'Resend code'),
            ),
            SizedBox(height: 80),
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
                  label: 'Verify',
                  width: 167,
                  height: 42,
                  onTap: () {
                    // if (_formKey.currentState!.validate()) {}
                    otp = '${_controllers[0].text}${_controllers[1].text}${_controllers[2].text}${_controllers[3].text}';
                    print('${otp}');
                    GoRouter.of(
                        context,
                      ).pushNamed(AppRouteNames.SaveLoginInfo);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
