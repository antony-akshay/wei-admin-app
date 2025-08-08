import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wei_admin/common_widgets/custom_inner_shadow_icon_button.dart';
import 'package:wei_admin/common_widgets/custom_text.dart';
import 'package:wei_admin/common_widgets/grey_button.dart';
import 'package:wei_admin/core/app_colors.dart';
import 'package:wei_admin/features/profile/widgets/color_button.dart';
import 'package:wei_admin/features/settings/presentation/login_history_screen.dart';

class EventScreen extends StatelessWidget {
  final bool isPaid; // pass this in from parent

  const EventScreen({super.key, required this.isPaid});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              child: Row(
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
            ),

            SizedBox(height: 8.h),

            const EventCarouselTile(),

            SizedBox(height: 16.h),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                children: [
                  Text(
                    "Details",
                    style: GoogleFonts.urbanist(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 20.w),
                  Text(
                    "Feedbacks",
                    style: GoogleFonts.urbanist(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: GlowingDivider(),
            ),

            SizedBox(height: 12.h),

            // Details section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  _detailRow("Event name", "Coldplay concert"),
                  _detailRow("Type", "Seminar"),
                  _detailRow("Sub category", "Technology"),
                  _detailRow("Date", "20/08/2025"),
                  _detailRow("Location", "Online"),
                  _detailRow("Attendance", "22,666"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _labelText("Rating"),
                      Row(
                        children: List.generate(
                          3,
                          (index) => Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 18.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _labelText("Status"),
                      Container(
                        width: 89,
                        height: 25,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Center(
                          child: CustomText(
                            text: 'Completed',
                            fontColor: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const Spacer(),

            Padding(
              padding: EdgeInsets.all(16.w),
              child: isPaid
                  ? Row(
                      children: [
                        Expanded(
                          child: GreyButton(
                            label: 'Event Details',
                            width: 167,
                            height: 42,
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: ColorButton(
                            label: 'Payment details',
                            width: 167,
                            height: 42,
                          ),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GreyButton(
                          label: 'Event Details',
                          width: 167,
                          height: 42,
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _detailRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _labelText(label),
          Flexible(
            child: Text(
              value,
              style: GoogleFonts.urbanist(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }

  Widget _labelText(String text) {
    return Text(
      "$text :",
      style: GoogleFonts.urbanist(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: Color.fromRGBO(129, 129, 129, 1),
      ),
    );
  }

  Widget _buildButton(String text, {Color bgColor = const Color(0xFF4A4A4A)}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Center(
        child: Text(
          text,
          style: GoogleFonts.urbanist(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class EventCarouselTile extends StatefulWidget {
  const EventCarouselTile({super.key});

  @override
  State<EventCarouselTile> createState() => _EventCarouselTileState();
}

class _EventCarouselTileState extends State<EventCarouselTile> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 350,
          height: 167,
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
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
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24.r),
            child: AspectRatio(
              aspectRatio: 16 / 9, // Keeps the image proportional
              child: PageView.builder(
                controller: _pageController,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Image.asset(
                    'assets/images/test_image_2.jpg',
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  );
                },
              ),
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
