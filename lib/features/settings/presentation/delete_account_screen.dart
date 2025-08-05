import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wei_admin/common_widgets/custom_inner_shadow_icon_button.dart';
import 'package:wei_admin/common_widgets/custom_text.dart';
import 'package:wei_admin/common_widgets/grey_button.dart';
import 'package:wei_admin/features/profile/widgets/color_button.dart';

class DeleteAccountScreen extends StatefulWidget {
  DeleteAccountScreen({super.key});

  @override
  State<DeleteAccountScreen> createState() => _DeleteAccountScreenState();
}

class _DeleteAccountScreenState extends State<DeleteAccountScreen> {
  bool activityHistory = true;
  bool contentFiles = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              SizedBox(height: 16.h),
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
                          'Export data before deletion',
                          style: GoogleFonts.urbanist(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          'Deleting your account is permanent. Be sure to download your data first.',
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 167.w,
                    height: 116.h,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(0, 125, 255, 0.15),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 16.w,
                          height: 20.h,
                          child: SvgPicture.asset(
                            'assets/icons/settings/adobe.svg',
                          ),
                        ),
                        CustomText(
                          text: 'PDF Export',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        SizedBox(
                          width: 143.w,
                          child: CustomText(
                            textAlign: TextAlign.center,
                            text: 'Complete profile and activity summary',
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            fontColor: const Color.fromRGBO(129, 129, 129, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 167.w,
                    height: 116.h,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(56, 56, 56, 1),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 24.w,
                          height: 24.h,
                          child: SvgPicture.asset('assets/icons/settings/xl.svg'),
                        ),
                        CustomText(
                          text: 'Excel export',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        SizedBox(
                          width: 143.w,
                          child: CustomText(
                            textAlign: TextAlign.center,
                            text: 'Structured data in spreadsheet format',
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            fontColor: const Color.fromRGBO(129, 129, 129, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              CheckboxTile(
                value: activityHistory,
                label: "Activity History\nLogin history, usage statistics, and timestamps",
                onChanged: (value) => setState(() => activityHistory = value),
              ),
              CheckboxTile(
                value: contentFiles,
                label: "Content & Files\nUploaded files, created content, and documents",
                onChanged: (value) => setState(() => contentFiles = value),
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GreyButton(
                      label: 'Skip',
                      width: 167.w,
                      height: 42.h,
                      onTap: () => Navigator.pop(context),
                    ),
                    ColorButton(
                      label: 'Export',
                      width: 167.w,
                      height: 42.h,
                      onTap: () {},
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

class CheckboxTile extends StatelessWidget {
  final bool value;
  final String label;
  final ValueChanged<bool> onChanged;

  const CheckboxTile({
    Key? key,
    required this.value,
    required this.label,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 10.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 20.w,
              height: 20.w,
              margin: EdgeInsets.only(right: 12.w),
              decoration: BoxDecoration(
                color: value ? Colors.white : Colors.transparent,
                borderRadius: BorderRadius.circular(4.r),
                border: Border.all(color: Colors.white, width: 2.w),
              ),
              child: value
                  ? Icon(Icons.check, size: 14.sp, color: Colors.black)
                  : null,
            ),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  color: const Color.fromRGBO(129, 129, 129, 1),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  height: 1.4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
