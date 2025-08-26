import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:wei_admin/common_widgets/custom_inner_shadow_button.dart';
import 'package:wei_admin/common_widgets/custom_text.dart';
import 'package:wei_admin/core/app_colors.dart';
import 'package:wei_admin/features/chat/presentation/widgets/gradient_divider.dart';
import 'package:wei_admin/features/create_event/presentation/widgets/event_preview_item_tile.dart';

class AddOnEventsTab extends StatelessWidget {
  const AddOnEventsTab({super.key});

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
                    borderRadius: BorderRadius.circular(12.r),
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
                        text: "Lucifer",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(height: 6.h),
                      CustomText(
                        text: "20 AUG 2026",
                        fontSize: 12.sp,
                        fontColor: AppColors.secondaryFontColor,
                      ),
                      SizedBox(height: 6.h),
                      CustomText(
                        text: "Free",
                        fontSize: 12.sp,
                        fontColor: Color(0xFF5E5CE6),
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
