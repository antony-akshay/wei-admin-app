import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wei_admin/common_widgets/custom_inner_shadow_icon_button.dart';
import 'package:wei_admin/common_widgets/custom_text.dart';
import 'package:wei_admin/features/profile/widgets/color_button.dart';
import 'package:wei_admin/common_widgets/grey_button.dart';

class SecurityQuestionsScreen extends StatelessWidget {
  const SecurityQuestionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                        'Security questions',
                        style: GoogleFonts.urbanist(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        'Choose a security question to help verify your identity if you ever lose access.',
                        style: GoogleFonts.urbanist(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(129, 129, 129, 1),
                        ),
                      ),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              width: 350,
              height: 47,
              decoration: BoxDecoration(
                color: Color.fromRGBO(104, 104, 104, 1),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: 'Add security question',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                    Icon(Icons.add, color: Colors.white),
                  ],
                ),
              ),
            ),
            Container(
              width: 350,
              height: 47,
              decoration: BoxDecoration(
                color: Color.fromRGBO(56, 56, 56, 1),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: 'Select a question',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                    SvgPicture.asset(
                      'assets/icons/settings/drop_down.svg',
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 350,
              height: 118,
              decoration: BoxDecoration(
                color: Color.fromRGBO(56, 56, 56, 1),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: CustomText(
                  text: 'Answer the question',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GreyButton(label: 'Clear', width: 100, height: 32),
                ColorButton(label: 'Save', width: 100, height: 32),
              ],
            ),
            Container(
              width: 350,
              height: 47,
              decoration: BoxDecoration(
                color: Color.fromRGBO(62, 180, 137, 1),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: 'Famous footballer ~ Lionel Messi',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontColor: Colors.black,
                    ),
                    SvgPicture.asset(
                      'assets/icons/settings/rename.svg',
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 350,
              height: 47,
              decoration: BoxDecoration(
                color: Color.fromRGBO(62, 180, 137, 1),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: 'Famous Actor ~ Mohanlal',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontColor: Colors.black,
                    ),
                    SvgPicture.asset(
                      'assets/icons/settings/rename.svg',
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
