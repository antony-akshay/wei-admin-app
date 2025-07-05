import 'package:flutter/material.dart';
import 'package:flutter_inner_shadow/flutter_inner_shadow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wei_admin/core/app_colors.dart';
import 'package:wei_admin/screens/common_widgets/custom_inner_shadow_icon_button.dart';
import 'package:wei_admin/screens/common_widgets/custom_text.dart';
import 'package:wei_admin/screens/common_widgets/search_textfield.dart';
import 'package:wei_admin/screens/home/widgets/carousel_tile.dart';
import 'package:wei_admin/screens/home/widgets/welcome_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          // top section
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 22.5.w,
                  backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1521119989659-a83eee488004?q=80&w=1923&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                  ),
                ),
                SizedBox(width: 6.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Welcome back!",
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    CustomText(
                      text: "Emma Raducanu",
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      fontColor: AppColors.secondaryFontColor,
                    ),
                  ],
                ),
                Spacer(),
                CustomInnerShadowIconButton(
                  iconPath: "assets/icons/home/chatbot.svg",
                ),
                SizedBox(width: 10.w),
                CustomInnerShadowIconButton(
                  iconPath: "assets/icons/home/bell.svg",
                ),
              ],
            ),
          ),

          SizedBox(height: 24.h),

          // search section
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              children: [
                CustomInnerShadowIconButton(
                  iconPath: "assets/icons/common/filter.svg",
                ),
                Spacer(),
                SearchTextfield(width: 295.w),
              ],
            ),
          ),

          SizedBox(height: 24.h),

          // Carousel
          CarouselTile(),
          SizedBox(height: 64.h),

          // Welcome
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: WelcomeTile(),
          ),
        ],
      ),
    );
  }
}
