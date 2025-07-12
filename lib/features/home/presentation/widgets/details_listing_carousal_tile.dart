import 'package:flutter/material.dart';
import 'package:flutter_inner_shadow/flutter_inner_shadow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wei_admin/common_widgets/custom_text.dart';
import 'package:wei_admin/core/app_colors.dart';
import 'package:wei_admin/features/auth/presentation/widgets/auth_button.dart';

class DetailsListingCarousalTile extends StatelessWidget {
  DetailsListingCarousalTile({super.key});

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 168.w,
          child: Center(
            child: PageView.builder(
              controller: _pageController,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Center(
                  child: Container(
                    height: 160.w,
                    margin: EdgeInsets.symmetric(horizontal: 20.w),
                    decoration: BoxDecoration(
                      color: AppColors.backgroundColor,
                      borderRadius: BorderRadius.circular(24.r),
                      border: GradientBoxBorder(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [Color(0xFF343434), Color(0xFF171717)],
                        ),
                        width: 2.w,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(41),
                          offset: Offset(8, 8),
                          blurRadius: 12.w,
                          spreadRadius: 0,
                        ),
                        BoxShadow(
                          color: Colors.white.withAlpha(10),
                          offset: Offset(-8, -8),
                          blurRadius: 12.w,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        InnerShadow(
                          shadows: [
                            BoxShadow(
                              color: Colors.black.withAlpha(46),
                              offset: Offset(6, 6),
                              blurRadius: 12,
                            ),
                            BoxShadow(
                              color: Colors.white.withAlpha(20),
                              offset: Offset(-6, -6),
                              blurRadius: 12,
                            ),
                          ],
                          child: Container(
                            height: 25.w,
                            width: 50.w,
                            decoration: BoxDecoration(
                              color: AppColors.backgroundColor,
                              borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(12.r),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 11.h),
                        CustomText(
                          text: "TOTAL EVENT CREATED",
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          height: 22.sp / 12.sp,
                        ),
                        SizedBox(height: 12.h),
                        CustomText(
                          text: "666",
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        SizedBox(height: 12.h),
                        Container(
                          height: 35.88.w,
                          width: 111.w,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFF1E1242), Color(0xFF65498B)],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            borderRadius: BorderRadius.circular(33.r),
                            border: GradientBoxBorder(
                              gradient: LinearGradient(
                                colors: [Color(0xFF2E3234), Color(0xFF212426)],
                              ),
                              width: 1,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withAlpha(
                                  41,
                                ), // 16% opacity
                                offset: const Offset(5.06, 5.06),
                                blurRadius: 10.13,
                              ),
                              BoxShadow(
                                color: Colors.white.withAlpha(10), // 4% opacity
                                offset: const Offset(-5.06, -5.06),
                                blurRadius: 10.13,
                              ),
                            ],
                          ),

                          child: Center(
                            child: CustomText(
                              text: "See more",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        SizedBox(height: 8.h),
        SmoothPageIndicator(
          controller: _pageController,
          count: 3,
          effect: ExpandingDotsEffect(
            activeDotColor: Colors.white,
            dotColor: Colors.white38,
            dotHeight: 10,
            dotWidth: 10,
            spacing: 8,
          ),
        ),
      ],
    );
  }
}
