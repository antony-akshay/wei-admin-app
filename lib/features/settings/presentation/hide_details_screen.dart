import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wei_admin/common_widgets/custom_inner_shadow_icon_button.dart';
import 'package:wei_admin/features/settings/presentation/notification_settings_screen.dart';

class HideDetailsScreen extends StatelessWidget {
  HideDetailsScreen({super.key});

  bool isEmail = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
                          'Hide details',
                          style: GoogleFonts.urbanist(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          'Control who can see your profile and activity details.',
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
              SizedBox(height: 20),
              NotificationToggleTile(
                textColor: Color.fromRGBO(255, 255, 255, 1),
                fontSize: 16,
                title: 'Email ID',
                value: isEmail,
                onChanged: (value) {},
              ),
              NotificationToggleTile(
                textColor: Color.fromRGBO(255, 255, 255, 1),
                fontSize: 16,
                title: 'Contact number',
                value: isEmail,
                onChanged: (value) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
