import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wei_admin/common_widgets/custom_inner_shadow_icon_button.dart';
import 'package:wei_admin/common_widgets/search_textfield.dart';

class EventsHostedScreen extends StatelessWidget {
  EventsHostedScreen({super.key});

  final List<Concert> dummyConcerts = [
    Concert(
      imagePath: 'assets/images/test_image_2.jpg',
      title: 'Coldplay concert',
      date: '20 AUG 2025',
      isPaid: true,
      description: 'Bellie Eillish concert',
    ),
    Concert(
      imagePath: 'assets/images/test_image_2.jpg',
      title: 'Coldplay concert',
      date: '20 AUG 2025',
      isPaid: false,
      description: 'Bellie Eillish concert',
    ),
    Concert(
      imagePath: 'assets/images/test-photo.jpg',
      title: 'Coldplay concert',
      date: '20 AUG 2025',
      isPaid: true,
      description: null,
    ),
    // more...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
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
              SizedBox(height: 30.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomInnerShadowIconButton(
                    iconPath: "assets/icons/common/filter.svg",
                  ),
                  SearchTextfield(width: 295.w),
                ],
              ),
              SizedBox(height: 30.h),
              Expanded(
                child: ListView.builder(
                  itemCount: dummyConcerts.length,
                  itemBuilder: (context, index) {
                    return ConcertListTile(
                      concert: dummyConcerts[index],
                      onTap: () {
                        print(dummyConcerts[index].isPaid);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Concert {
  final String imagePath;
  final String title;
  final String date;
  final bool isPaid;
  final String? description;

  Concert({
    required this.imagePath,
    required this.title,
    required this.date,
    required this.isPaid,
    this.description,
  });
}

class ConcertListTile extends StatelessWidget {
  final Concert concert;
  final VoidCallback? onTap;

  const ConcertListTile({
    super.key,
    required this.concert,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            Container(
              height: 76.h,
              width: 76.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                image: DecorationImage(
                  image: AssetImage(concert.imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 12.w),

            // Text content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    concert.title,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    concert.date,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromRGBO(129, 129, 129, 1),
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      Text(
                        concert.isPaid ? 'Paid' : 'Free',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: concert.isPaid
                              ? const Color.fromRGBO(62, 180, 137, 1)
                              : Colors.blueAccent,
                        ),
                      ),
                      if (concert.description != null) ...[
                        SizedBox(width: 4.w),
                        Text(
                          '(${concert.description})',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromRGBO(129, 129, 129, 1),
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),

            // Arrow icon
            Padding(
              padding: EdgeInsets.only(top: 30.h),
              child: SvgPicture.asset(
                'assets/icons/settings/right_arrow.svg',
                height: 16.h,
                width: 16.w,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
