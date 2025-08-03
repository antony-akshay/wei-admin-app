import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wei_admin/common_widgets/custom_checkbox_tile.dart';
import 'package:wei_admin/common_widgets/custom_inner_shadow_icon_button.dart';
import 'package:wei_admin/common_widgets/custom_text.dart';
import 'package:wei_admin/common_widgets/grey_button.dart';
import 'package:wei_admin/features/profile/widgets/color_button.dart';
import 'package:wei_admin/features/settings/presentation/main_settings_screen.dart';
import 'package:wei_admin/features/settings/presentation/notification_settings_screen.dart';

class PostEverywhereScreen extends StatefulWidget {
  PostEverywhereScreen({super.key});

  @override
  State<PostEverywhereScreen> createState() => _PostEverywhereScreenState();
}

class _PostEverywhereScreenState extends State<PostEverywhereScreen> {
  bool isShareEvents = true;
  bool shareAsStory = true;
  bool shareAsPost = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                          'One Post, Everywhere!',
                          style: GoogleFonts.urbanist(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          'Auto-share your events on all linked social platforms.',
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
              CustomText(
                text: 'Connected Accounts',
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
              SizedBox( height:  10.h),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: SvgPicture.asset('assets/icons/settings/insta.svg'),
                title: CustomText(
                  text: 'Instagram',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              NotificationToggleTile(
                title: 'Do you want to share your events on Instagram?',
                value: isShareEvents,
                onChanged: (bool value) {
                  setState(() => isShareEvents = value);
                },
              ),
              SizedBox(height: 10.h),
              CustomCheckboxTile(
                value: shareAsStory,
                label: "Share as instagram story",
                onChanged: (value) => setState(() => shareAsStory = value),
              ),
              SizedBox(height: 10.h),
              CustomCheckboxTile(
                value: shareAsPost,
                label: "Share as instagram post",
                onChanged: (value) => setState(() => shareAsPost = value),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: GlowingDivider(),
              ),
              CustomText(
                text: 'Available platforms',
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 10.h),
              platformTile('assets/icons/settings/fb.svg'),
              SizedBox(height: 15.h),
              GlowingDivider(),
              platformTile('assets/icons/settings/x.svg'),
              SizedBox(height: 15.h),
              GlowingDivider(),
              platformTile('assets/icons/settings/li.svg'),
              SizedBox(height: 15.h),
              GlowingDivider(),
            ],
          ),
        ),
      ),
    );
  }

  Widget platformTile(String iconPath) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: SizedBox(
        width: 22.w,
        height: 22.h,
        child: SvgPicture.asset(iconPath),
      ),
      title: Text('', style: GoogleFonts.urbanist(color: Colors.white)),
      trailing: ColorButton(
        label: 'Connect',
        width: 100.w,
        height: 32.h,
        onTap: () {},
      ),
    );
  }
}
