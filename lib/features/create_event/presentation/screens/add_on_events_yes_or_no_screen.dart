import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:wei_admin/common_widgets/custom_inner_shadow_button.dart';
import 'package:wei_admin/common_widgets/custom_text.dart';
import 'package:wei_admin/core/app_colors.dart';
import 'package:wei_admin/routes/app_route_constants.dart';

class AddOnEventsYesOrNoScreen extends StatelessWidget {
  const AddOnEventsYesOrNoScreen({
    super.key,
    required this.isAddingNextAddonEvent,
  });
  final bool isAddingNextAddonEvent;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 64.w,
              width: 64.w,
              decoration: BoxDecoration(
                color: AppColors.modalColor,
                borderRadius: BorderRadius.circular(50.w),
              ),
              child: Center(
                child: SvgPicture.asset(
                  "assets/icons/event/add_on.svg",
                  height: 24.w,
                  width: 24.w,
                ),
              ),
            ),
            SizedBox(height: 32.h),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.modalColor,
                borderRadius: BorderRadius.circular(24.r),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 25.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomText(
                      text: isAddingNextAddonEvent
                          ? "Do you have any other add-on event?"
                          : "Any extra events planned?",
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: 8.h),
                    CustomText(
                      text:
                          "Let us know if your main event includes additional sessions, workshops, or side events.",
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.center,
                      fontColor: AppColors.secondaryFontColor,
                    ),
                    SizedBox(height: 100.h),
                    Row(
                      children: [
                        Expanded(
                          child: CustomInnerShadowButton(
                            ontap: () => GoRouter.of(
                              context,
                            ).pushNamed(AppRouteNames.ticketDetailsAdding),
                            label: "No",
                            backgroundColor: AppColors.tertiaryButtonColor,
                          ),
                        ),
                        SizedBox(width: 16.w),
                        Expanded(
                          child: CustomInnerShadowButton(
                            ontap: () => GoRouter.of(
                              context,
                            ).pushNamed(AppRouteNames.addOnEventsManaging),
                            label: "Yes",
                            backgroundColor: AppColors.secondaryButtonColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
