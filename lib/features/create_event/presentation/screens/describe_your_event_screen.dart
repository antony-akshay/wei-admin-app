import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:wei_admin/common_widgets/common_form_dropdown.dart';
import 'package:wei_admin/common_widgets/common_form_textfield.dart';
import 'package:wei_admin/common_widgets/custom_inner_shadow_button.dart';
import 'package:wei_admin/common_widgets/custom_inner_shadow_icon_button.dart';
import 'package:wei_admin/common_widgets/custom_text.dart';
import 'package:wei_admin/core/app_colors.dart';
import 'package:wei_admin/features/create_event/presentation/screens/add_on_events_managing_screen.dart';
import 'package:wei_admin/features/create_event/presentation/widgets/create_event_header.dart';
import 'package:wei_admin/features/create_event/presentation/widgets/top_section_card.dart';
import 'package:wei_admin/routes/app_route_constants.dart';

class DescribeYourEventScreen extends StatelessWidget {
  DescribeYourEventScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 24.h),
                    CreateEventHeader(),
                  SizedBox(height: 24.h),
                  Center(
                    child: TopSectionCard(
                      iconPath: "assets/icons/event/describe_event.svg",
                      progress: "Step 5/6",
                      title: "Describe Your Event",
                      description:
                          "Give a brief overview of your event for attendees.",
                    ),
                  ),
                  SizedBox(height: 32.h),
                  CustomText(
                    text: "Description*",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(height: 14.h),
                  CommonFormTextfield(
                    controller: _descriptionController,
                    hint: "Describe your event here...",
                    maxLines: 5,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Event description is required";
                      }
                    },
                  ),
                  SizedBox(height: 12.h),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      height: 38.h,
                      width: 160.w,
                      decoration: BoxDecoration(
                        color: Color(0xFF606060),
                        borderRadius: BorderRadius.circular(28.r),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              text: "Generate using Wie",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(width: 2.w),
                            SvgPicture.asset("assets/icons/common/ai_star.svg"),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 84.h),
                  Row(
                    children: [
                      Expanded(
                        child: CustomInnerShadowButton(
                          label: "Go back",
                          backgroundColor: AppColors.tertiaryButtonColor,
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Expanded(
                        child: CustomInnerShadowButton(
                          ontap: () {
                            if (_formKey.currentState!.validate()) {
                                  GoRouter.of(
                                    context,
                                  ).pushNamed(AppRouteNames.addVisualsToYourEvent);
                            }
                          },
                          label: "Save and continue",
                          backgroundColor: AppColors.secondaryButtonColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
