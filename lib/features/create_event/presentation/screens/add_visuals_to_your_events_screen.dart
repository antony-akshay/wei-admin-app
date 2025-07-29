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
import 'package:wei_admin/features/create_event/presentation/widgets/top_section_card.dart';
import 'package:wei_admin/routes/app_route_constants.dart';

class AddVisualsToYourEventsScreen extends StatelessWidget {
  AddVisualsToYourEventsScreen({super.key});
  final _formKey = GlobalKey<FormState>();

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
                  Row(
                    children: [
                      CustomInnerShadowIconButton(
                        iconPath: "assets/icons/common/arrow_back.svg",
                      ),
                      SizedBox(width: 8.w),
                      CustomText(
                        text: "Create event",
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  Center(
                    child: TopSectionCard(
                      iconPath: "assets/icons/event/add_visuals.svg",
                      progress: "Step 6/6",
                      title: "Describe Your Event",
                      description:
                          "Give a brief overview of your event for attendees.",
                    ),
                  ),
                  SizedBox(height: 32.h),

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
                              ).pushNamed(AppRouteNames.pinThePlace);
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
