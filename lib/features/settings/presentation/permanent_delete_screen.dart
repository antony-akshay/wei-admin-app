import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:wei_admin/common_widgets/custom_inner_shadow_icon_button.dart';
import 'package:wei_admin/common_widgets/custom_text.dart';
import 'package:wei_admin/common_widgets/grey_button.dart';
import 'package:wei_admin/features/settings/presentation/delete_account_screen.dart';

class PermanentDeleteScreen extends StatefulWidget {
  const PermanentDeleteScreen({super.key});

  @override
  State<PermanentDeleteScreen> createState() => _PermanentDeleteScreenState();
}

class _PermanentDeleteScreenState extends State<PermanentDeleteScreen> {
  bool undone = true;
  bool ack = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Header
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
                          'Permanent Deletion',
                          style: GoogleFonts.urbanist(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          'All your data will be erased. Once deleted, it can’t be recovered.',
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

              SizedBox(height: 25.h),

              /// Warning Box
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(
                        color: const Color.fromRGBO(238, 210, 2, 1),
                        width: 1.w,
                      ),
                      color: const Color.fromRGBO(238, 210, 2, 0.1),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(20.w),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/settings/warning.svg',
                            width: 20.w,
                            height: 20.h,
                          ),
                          SizedBox(width: 5.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: ' Warning',
                                  fontColor: const Color.fromRGBO(
                                    238,
                                    210,
                                    2,
                                    1,
                                  ),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                                SizedBox(height: 5.h),
                                CustomText(
                                  text:
                                      ' Your account and data will be permanently deleted after a 30-day grace period. This action can’t be undone once the period ends.',
                                  fontColor: const Color.fromRGBO(
                                    180,
                                    180,
                                    180,
                                    1,
                                  ),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 25.h),

              /// Final Confirmation
              CustomText(
                text: ' Final Confirmation',
                fontColor: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 10.h),
              CustomText(
                text: ' Please confirm your decision before proceeding',
                fontColor: const Color.fromRGBO(180, 180, 180, 1),
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(height: 10.h),

              /// Checkboxes
              CheckboxTile(
                value: undone,
                label: "I understand that this action cannot be easily undone",
                onChanged: (value) => setState(() => undone = value),
              ),
              SizedBox(height: 5.h),
              CheckboxTile(
                value: ack,
                label:
                    "I understand the consequences and have saved my data, or I don’t need it.",
                onChanged: (value) => setState(() => ack = value),
              ),

              const Spacer(),

              Padding(
                padding: EdgeInsets.fromLTRB(16, 0, 0, 26),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GreyButton(label: 'Back', width: 167.w, height: 42.h),
                    SizedBox(width: 2),
                    Container(
                      width: 167.w,
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
                          text: 'Delete',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          fontColor: Colors.white,
                        ),
                      ),
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
