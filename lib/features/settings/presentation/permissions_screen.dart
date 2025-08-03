import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wei_admin/common_widgets/custom_inner_shadow_icon_button.dart';
import 'package:wei_admin/common_widgets/custom_text.dart';
import 'package:wei_admin/features/settings/presentation/login_history_screen.dart';
import 'package:wei_admin/features/settings/presentation/notification_settings_screen.dart';

class PermissionsScreen extends StatelessWidget {
  PermissionsScreen({super.key});

  bool isOff = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
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
                        'Third party account linking',
                        style: GoogleFonts.urbanist(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        'Manage third-party services linked to your account for login or data sync.',
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
            NotificationToggleTile(
              textColor: Color.fromRGBO(129, 129, 129, 1),
              fontSize: 16,
              title: 'Off',
              value: isOff,
              onChanged: (value) {},
            ),
            SizedBox(height: 15),
            GlowingDivider(),
            CustomText(
              text: 'Groups',
              fontSize: 14, // Default to 14 if not provided
              fontWeight: FontWeight.w600,
              fontColor: Colors.white, // Default to white if not provided
            ),
          ],
        ),
      ),
    );
  }
}
