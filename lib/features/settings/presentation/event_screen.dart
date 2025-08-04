import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wei_admin/common_widgets/custom_inner_shadow_icon_button.dart';
import 'package:wei_admin/features/home/presentation/widgets/details_listing_carousal_tile.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                        'Events hosted',
                        style: GoogleFonts.urbanist(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        'A summary of all previously conducted events',
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
            EventCarouselTile(),
          ],
        ),
      ),
    );
  }
}


class EventCarouselTile extends StatelessWidget {
  EventCarouselTile({super.key});

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Carousel Container
        Container(
          height: 200.h,
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          decoration: BoxDecoration(
            color: const Color(0xFF1C1C1C),
            borderRadius: BorderRadius.circular(32.r),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24.r),
            child: PageView.builder(
              controller: _pageController,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Image.asset(
                  'assets/images/test_image_2.jpg', // replace with your image
                  width: double.infinity,
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
        ),
        SizedBox(height: 10.h),
        SmoothPageIndicator(
          controller: _pageController,
          count: 3,
          effect: ExpandingDotsEffect(
            activeDotColor: Colors.white,
            dotColor: Colors.white38,
            dotHeight: 8.h,
            dotWidth: 8.w,
            spacing: 8.w,
          ),
        ),
      ],
    );
  }
}
