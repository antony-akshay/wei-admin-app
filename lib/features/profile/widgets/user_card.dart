import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:wei_admin/core/app_colors.dart';
import 'package:wei_admin/features/profile/widgets/color_button.dart';

class UserCard extends StatelessWidget {
  final String image;
  final String name;
  final String role;
  final bool isVerified;
  final int followers;
  final int projects;
  final VoidCallback? onFollow;

  const UserCard({
    super.key,
    required this.image,
    required this.name,
    required this.role,
    this.isVerified = false,
    required this.followers,
    required this.projects,
    this.onFollow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 167.w,
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.w),
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
          ),
          BoxShadow(
            color: Colors.white.withAlpha(10),
            offset: const Offset(-8, -8),
            blurRadius: 12.w,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: Image.asset(
              image,
              height: 143.h,
              width: 143.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (isVerified)
                Padding(
                  padding: EdgeInsets.only(left: 6.w),
                  child: SvgPicture.asset(
                    'assets/icons/common/verified.svg',
                    width: 18.w,
                    height: 18.w,
                  ),
                ),
            ],
          ),
          SizedBox(height: 4.h),
          Text(
            role,
            style: TextStyle(color: Colors.grey[400], fontSize: 14.sp),
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.person, color: Colors.white, size: 18.sp),
              SizedBox(width: 4.w),
              Text(followers.toString(), style: TextStyle(color: Colors.white)),
              SizedBox(width: 12.w),
              SizedBox(
                width: 20,
                height: 20,
                child: SvgPicture.asset('assets/icons/common/calendar.svg'),
              ),
              SizedBox(width: 4.w),
              Text(projects.toString(), style: TextStyle(color: Colors.white)),
            ],
          ),
          SizedBox(height: 12.h),
          // GestureDetector(
          //   onTap: onFollow,
          //   child: Container(
          //     width: double.infinity,
          //     height: 42.h,
          //     decoration: BoxDecoralabeltion(
          //       gradient: const LinearGradient(
          //         colors: [
          //           Color.fromARGB(255, 162, 137, 254),
          //           Color.fromARGB(228, 92, 80, 254),
          //         ],
          //         begin: Alignment.topCenter,
          //         end: Alignment.bottomCenter,
          //       ),
          //       borderRadius: BorderRadius.circular(33.r),
          //     ),
          //     child: Center(
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           Text(
          //             "Follow",
          //             style: TextStyle(
          //               fontSize: 14.sp,
          //               fontWeight: FontWeight.w600,
          //               color: Colors.white,
          //             ),
          //           ),
          //           SizedBox(width: 6.w),
          //           Icon(Icons.add, size: 16.sp, color: Colors.white),
          //         ],
          //       ),
          //     ),
          //   ),
          // )
          ColorButton(label: 'Follow +',width: 100,height: 32,),
        ],
      ),
    );
  }
}
