import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:wei_admin/common_widgets/custom_text.dart';
import 'package:wei_admin/core/app_colors.dart';
import 'package:wei_admin/features/buildteam/widgets/cancel_button.dart';
import 'package:wei_admin/features/profile/widgets/color_button.dart';
import 'package:wei_admin/features/profile/widgets/grey_button.dart'; // Make sure this has `AppColors.backgroundColor`

class OtheruserProfileCard extends StatelessWidget {
  final String name;
  final String username;
  final String bio;
  final int events;
  final int followers;
  final int following;
  final String profileImage;

  const OtheruserProfileCard({
    super.key,
    required this.name,
    required this.username,
    required this.bio,
    required this.events,
    required this.followers,
    required this.following,
    required this.profileImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.w),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(24.r),
        border: GradientBoxBorder(
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Color(0xFF343434), Color(0xFF171717)],
          ),
          width: 2.w,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(41),
            offset: const Offset(8, 8),
            blurRadius: 12.w,
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Colors.white.withAlpha(10),
            offset: const Offset(-8, -8),
            blurRadius: 12.w,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile row
          Row(
            children: [
              ClipOval(
                child: Image.asset(
                  profileImage, // replace with your path
                  width: 76.r,
                  height: 76.r,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(text: name, fontSize: 18),
                  CustomText(
                    text: '@${username}',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontColor: Color.fromRGBO(129, 129, 129, 1),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 12.h),

          // Bio
          CustomText(text: bio, fontSize: 12.sp, fontColor: Colors.white70),

          SizedBox(height: 12.h),

          // Stats
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildStat(events.toString(), "Events"),
              SizedBox(width: 8),
              _buildStat(followers.toString(), "Followers"),
              SizedBox(width: 8),
              _buildStat(following.toString(), "Following"),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ColorButton(label: 'Follow +', width: 100, height: 32),
              GreyButton(label: 'Invite to group', width: 100, height: 32),
              GreyButton(label: 'Insight profile', width: 100, height: 32),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStat(String number, String label) {
    return Row(
      children: [
        CustomText(text: number),
        SizedBox(width: 5),
        CustomText(text: label, fontColor: Color.fromRGBO(129, 129, 129, 1)),
      ],
    );
  }
}
