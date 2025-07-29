import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:wei_admin/common_widgets/custom_text.dart';
import 'package:wei_admin/core/app_colors.dart';

class EventCard extends StatelessWidget {
  const EventCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 167.w,
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 13.w),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(24.r),
        border: const GradientBoxBorder(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Color(0xFF343434), Color(0xFF171717)],
          ),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(41),
            offset: Offset(8, 8),
            blurRadius: 12.w,
          ),
          BoxShadow(
            color: Colors.white.withAlpha(10),
            offset: Offset(-8, -8),
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
              'assets/img/signup1_img_1.jpg',
              height: 143.w,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 12.h),
          CustomText(
            text: 'Invento 2025',
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(height: 4.h),
          CustomText(
            text: 'Tech fest',
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            fontColor: const Color.fromRGBO(129, 129, 129, 1),
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              EventStat(icon: 'assets/icons/profile/like.svg', count: '12k'),
              EventStat(icon: 'assets/icons/profile/ticket.svg', count: '12k'),
              EventStat(icon: 'assets/icons/profile/share.svg', count: '200'),
              EventStat(icon: 'assets/icons/profile/bag.svg', count: '10'),
            ],
          ),
        ],
      ),
    );
  }
}

class EventStat extends StatelessWidget {
  final String icon;
  final String count;

  const EventStat({super.key, required this.icon, required this.count});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Icon(icon, color: Colors.white, size: 20.sp),
        SvgPicture.asset(icon),
        SizedBox(height: 4.h),
        Text(
          count,
          style: TextStyle(
            fontSize: 12.sp,
            color: Colors.white.withOpacity(0.9),
          ),
        ),
      ],
    );
  }
}
