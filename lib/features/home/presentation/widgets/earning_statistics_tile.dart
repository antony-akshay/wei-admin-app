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

  final List<Map<String, dynamic>> chats = [
    {
      'image':
          'https://images.unsplash.com/photo-1554151228-14d9def656e4?q=80&w=1972&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'name': "Emma",
      'message': 'Hi Sangeeth',
      'time': '12:00PM',
      'count': 3,
    },
    {
      'image':
          'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'name': "Micheal",
      'message': 'Hello! how are you',
      'time': '10:24AM',
      'count': 5,
    },
    {
      'image':
          'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'name': "Sachin",
      'message': 'Hey 🙋‍♂️',
      'time': '12:00PM',
      'count': 0,
    },
    {
      'image':
          'https://images.unsplash.com/photo-1554151228-14d9def656e4?q=80&w=1972&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'name': "Emma",
      'message': 'Hi Sangeeth',
      'time': '12:00PM',
      'count': 3,
    },
    {
      'image':
          'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'name': "Micheal",
      'message': 'Hello! how are you',
      'time': '10:24AM',
      'count': 5,
    },
    {
      'image':
          'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'name': "Sachin",
      'message': 'Hey 🙋‍♂️',
      'time': '12:00PM',
      'count': 0,
    },
    {
      'image':
          'https://images.unsplash.com/photo-1554151228-14d9def656e4?q=80&w=1972&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'name': "Emma",
      'message': 'Hi Sangeeth',
      'time': '12:00PM',
      'count': 3,
    },
    {
      'image':
          'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'name': "Micheal",
      'message': 'Hello! how are you',
      'time': '10:24AM',
      'count': 5,
    },
    {
      'image':
          'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'name': "Sachin",
      'message': 'Hey 🙋‍♂️',
      'time': '12:00PM',
      'count': 0,
    },
  ];
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

        SizedBox(height: 24.h),

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
                padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 12.h),
                child: CustomOuterShadowContainer(
                  child: Column(
                    children: [
                      WeeklyBarChart(
                        weeklyData: [20, 45, 30, 70, 85, 40, 25],

                        maxY: 100,
                      ),
                    ],
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
