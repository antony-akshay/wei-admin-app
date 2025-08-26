import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wei_admin/common_widgets/custom_text.dart';
import 'package:wei_admin/core/app_colors.dart';
import 'package:wei_admin/features/chat/presentation/widgets/gradient_divider.dart';

class GuestDetailsTab extends StatelessWidget {
  const GuestDetailsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 42.h, 20.w, 10.h),
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40.r),
                    child: Container(
                      height: 76.w,
                      width: 76.w,
                      child: Image(
                        image: NetworkImage(
                          "https://images.unsplash.com/photo-1554151228-14d9def656e4?q=80&w=1972&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "Zayed Masood",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(height: 11.h),
                      CustomText(
                        text: "https://en.wikipedia.org/wiki/Prithviraj_S..",
                        fontSize: 12.sp,
                        fontColor: Color(0xFF00BBFF),
                      ),
                    ],
                  ),
                  Spacer(),
                  SvgPicture.asset(
                    "assets/icons/common/right_arrow.svg",
                    height: 16.w,
                    width: 16.w,
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              GradientDivider(),
              SizedBox(height: 8.h),
            ],
          );
        },
      ),
    );
  }
}
