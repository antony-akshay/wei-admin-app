import 'package:flutter/material.dart';
import 'package:flutter_inner_shadow/flutter_inner_shadow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wei_admin/core/app_colors.dart';
import 'package:wei_admin/screens/common_widgets/custom_inner_shadow_button.dart';
import 'package:wei_admin/screens/common_widgets/custom_text.dart';
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
                CustomInnerShadowButton(
                  iconPath: "assets/icons/home/chatbot.svg",
                ),
                SizedBox(width: 10.w),
                CustomInnerShadowButton(iconPath: "assets/icons/home/bell.svg"),
              ],
            ),
          ),

          SizedBox(height: 24.h),

          // search section
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              children: [
                CustomInnerShadowButton(
                  iconPath: "assets/icons/common/filter.svg",
                ),
                Spacer(),
                ClipRRect(
                  borderRadius: BorderRadius.circular(50.r),
                  child: SizedBox(
                    width: 295.w,
                    child: InnerShadow(
                      shadows: [
                        BoxShadow(
                          color: Colors.black.withAlpha(46),
                          offset: Offset(-6, -6),
                          blurRadius: 12,
                        ),
                        BoxShadow(
                          color: Colors.white.withAlpha(20),
                          offset: Offset(6, 6),
                          blurRadius: 12,
                        ),
                      ],
                      child: Container(
                        height: 45.w,
                        decoration: BoxDecoration(
                          color: AppColors.backgroundColor,
                          borderRadius: BorderRadius.circular(50.r),
                        ),
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(left: 12.w, right: 12.w),
                        child: Row(
                          children: [
                            Icon(Icons.search, color: Colors.white),
                            SizedBox(width: 8.w),
                            Expanded(
                              child: TextFormField(
                                decoration: InputDecoration(
                                  isCollapsed: true,
                                  border: InputBorder.none,
                                  hintText: 'Search...',
                                  hintStyle: TextStyle(
                                    color: Colors.white.withOpacity(0.5),
                                  ),
                                ),
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
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
