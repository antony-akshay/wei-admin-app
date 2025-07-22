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

class PinThePlaceScreen extends StatelessWidget {
  PinThePlaceScreen({super.key});
  final TextEditingController _eventNameController = TextEditingController();
  final List<String> _eventTypes = ["Type 1", "Type 2", "Type 3"];
  final _formKey = GlobalKey<FormState>();
  final ValueNotifier<String?> _eventTypeNotifier = ValueNotifier(null);
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
                      iconPath: "assets/icons/event/pin_the_place.svg",
                      progress: "Step 2/6",
                      title: "Pin the Place, Pick the Format!",
                      description: "Add the name, category, and subcategory.",
                    ),
                  ),
                  SizedBox(height: 32.h),
                  CustomText(
                    text: "Event type*",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(height: 14.h),
                  CommonFormDropdown(
                    hint: "Select your event type",
                    items: _eventTypes,
                    selectedValueNotifier: _eventTypeNotifier,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Event type is required";
                      }
                    },
                  ),
                  SizedBox(height: 32.h),
                  CustomText(
                    text: "Event location*",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(height: 14.h),
                  CommonFormTextfield(
                    controller: _eventNameController,
                    hint: "Enter your event location",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Event location is required";
                      }
                    },
                  ),
                  SizedBox(height: 32.h),
                  CustomText(
                    text: "Exact map location*",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(height: 14.h),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF606060),
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 13.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/icons/event/view_map.svg",
                            height: 18.w,
                            width: 18.w,
                          ),
                          SizedBox(width: 16.w),
                          CustomText(text: "View map", fontSize: 14.sp),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 84.h),
                  Row(
                    children: [
                      Expanded(
                        child: CustomInnerShadowButton(
                          ontap: () => GoRouter.of(context).pop(),
                          label: "Go back",
                          backgroundColor: AppColors.tertiaryButtonColor,
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Expanded(
                        child: CustomInnerShadowButton(
                          // ontap: () => GoRouter.of(
                          //   context,
                          // ).pushNamed(AppRouteNames.eventBasics),
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
