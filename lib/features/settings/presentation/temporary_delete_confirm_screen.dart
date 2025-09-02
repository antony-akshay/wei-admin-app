import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:wei_admin/common_widgets/custom_inner_shadow_icon_button.dart';
import 'package:wei_admin/common_widgets/custom_text.dart';
import 'package:wei_admin/common_widgets/grey_button.dart';

class TemporaryDeleteConfirmScreen extends StatelessWidget {
  final String startDate;
  final String endDate;
  final int duration;

  const TemporaryDeleteConfirmScreen({
    super.key,
    required this.startDate,
    required this.endDate,
    required this.duration,
  });

  int getDurationDays() {
    try {
      final start = DateTime.parse(startDate);
      final end = DateTime.parse(endDate);
      return end.difference(start).inDays.abs();
    } catch (_) {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final durationDays = getDurationDays();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const CustomInnerShadowIconButton(
                      iconPath: "assets/icons/common/arrow_back.svg",
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Temporary Deletion',
                          style: GoogleFonts.urbanist(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          'Hide your profile and mute notifications temporarily. Your account will reactivate automatically.',
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
              SizedBox(height: 50.h),
              Container(
                width: 350.w,
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.r),
                  color: const Color.fromRGBO(56, 56, 56, 1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.h),
                    CustomText(
                      text: 'Confirm account suspension',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/settings/time.svg',
                          width: 16.w,
                          height: 16.w,
                        ),
                        SizedBox(width: 6.w),
                        CustomText(
                          text: 'Temporary suspension',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                    SizedBox(height: 15.h),
                    CustomText(
                      text: 'Your account will be temporarily suspended from:',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      fontColor: const Color.fromRGBO(129, 129, 129, 1),
                    ),
                    SizedBox(height: 10.h),
                    CustomText(
                      text: startDate,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: 8.h),
                    CustomText(
                      text: 'to',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      fontColor: const Color.fromRGBO(129, 129, 129, 1),
                    ),
                    SizedBox(height: 8.h),
                    CustomText(
                      text: endDate,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: 9.h),
                    CustomText(
                      text:
                          'Duration: $duration day${durationDays != 1 ? 's' : ''}',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      fontColor: const Color.fromRGBO(129, 129, 129, 1),
                    ),
                    SizedBox(height: 12.h),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(238, 210, 2, 0.2),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      padding: EdgeInsets.all(12.w),
                      child: CustomText(
                        text:
                            'We’ll hide your profile and pause alerts. You’ll be back automatically when the time’s up.',
                        fontColor: const Color.fromRGBO(180, 180, 180, 1),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GreyButton(label: 'Back', width: 146.w, height: 42.h,onTap: () => Navigator.pop(context),),
                        GestureDetector(
                          child: Container(
                            width: 146.w,
                            height: 42.h,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 239, 117, 117),
                                  Color.fromARGB(255, 255, 0, 13),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                              borderRadius: BorderRadius.circular(33.r),
                              border: GradientBoxBorder(
                                gradient: const LinearGradient(
                                  colors: [Color(0xFF3E3E3E), Color(0xFF262626)],
                                ),
                                width: 1.w,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withAlpha(100),
                                  offset: Offset(6.w, 6.h),
                                  blurRadius: 12.r,
                                ),
                                BoxShadow(
                                  color: Colors.white.withAlpha(20),
                                  offset: Offset(-6.w, -6.h),
                                  blurRadius: 12.r,
                                ),
                              ],
                            ),
                            child: Center(
                              child: CustomText(
                                text: 'Schedule suspension',
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                fontColor: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
