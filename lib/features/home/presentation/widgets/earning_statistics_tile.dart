import 'package:flutter/material.dart';
import 'package:flutter_inner_shadow/flutter_inner_shadow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wei_admin/common_widgets/custom_outer_shadow_container.dart';
import 'package:wei_admin/common_widgets/custom_text.dart';
import 'package:wei_admin/core/app_colors.dart';
import 'package:wei_admin/features/home/presentation/widgets/earnings_chart.dart';

class EarningStatisticsTile extends StatefulWidget {
  const EarningStatisticsTile({super.key});

  @override
  State<EarningStatisticsTile> createState() => _EarningStatisticsTileState();
}

class _EarningStatisticsTileState extends State<EarningStatisticsTile> {
  int selectedIndex = 0;
  final PageController _pageController = PageController();

  final List<String> tabs = ["Weeks", "Months", "Years"];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            children: [
              SvgPicture.asset("assets/icons/home/statistics.svg"),
              SizedBox(width: 6.w),
              CustomText(
                text: "LIVE EVENTS EARNING STATISTICS",
                fontSize: 16.sp,
                height: 22.sp / 16.sp,
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: CustomOuterShadowContainer(
            height: 48.w,
            radius: 12.r,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(tabs.length, (index) {
                  final isSelected = selectedIndex == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                      _pageController.animateToPage(
                        index,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: InnerShadow(
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
                        height: 32.w,
                        width: 101.33.w,
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.backgroundColor
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                        child: Center(
                          child: CustomText(text: tabs[index], fontSize: 14.sp),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ),

        // SizedBox(height: 24.h),
        SizedBox(
          height: 275.h,
          child: PageView.builder(
            controller: _pageController,
            itemCount: 3,
            onPageChanged: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(
                  left: 20.w,
                  right: 20.w,
                  top: 12.h,
                ), // this padding is for the container for showing shadow
                child: CustomOuterShadowContainer(
                  radius: 24.r,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 18.w,
                      vertical: 24.h,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: "Bellie Ellish Concert",
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  fontColor: AppColors.secondaryFontColor,
                                ),
                                SizedBox(height: 4.h),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    CustomText(
                                      text: "\$66,672.61",
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    SizedBox(width: 5.w),
                                    CustomText(
                                      text: "Total amount",
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      fontColor: AppColors.secondaryFontColor,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Spacer(),
                            SvgPicture.asset(
                              "assets/icons/home/positive_statistics.svg",
                            ),
                            SizedBox(width: 6.w),
                            CustomText(
                              text: "14%",
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                        SizedBox(height: 21.h),
                        Expanded(
                          child: WeeklyBarChart(
                            weeklyData: [20, 45, 30, 70, 85, 40, 25],
                            maxY: 100,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
