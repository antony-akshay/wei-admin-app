import 'dart:developer';

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

class EventBasicsScreen extends StatelessWidget {
  EventBasicsScreen({super.key, this.showProgress = true});
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _eventNameController = TextEditingController();
  final List<String> _categories = ["Category 1", "Category 2", "Category 3"];
  final List<String> _subCategories = [
    "Sub category 1",
    "Sub category 2",
    "Sub category 3",
  ];
  final ValueNotifier<String?> _categoryNotifier = ValueNotifier(null);
  final ValueNotifier<String?> _subCategoryNotifier = ValueNotifier(null);
  final bool showProgress;
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
                      iconPath: "assets/icons/event/event_basics.svg",
                      progress: showProgress ? "Step 1/6" : null,
                      title: "Event Basics",
                      description: "Add the name, category, and subcategory.",
                    ),
                  ),
                  SizedBox(height: 32.h),
                  CustomText(
                    text: "Event name*",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(height: 14.h),
                  CommonFormTextfield(
                    controller: _eventNameController,
                    hint: "Enter your event name",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Event name is required";
                      }
                    },
                  ),
                  SizedBox(height: 32.h),
                  CustomText(
                    text: "Event category*",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(height: 14.h),
                  CommonFormDropdown(
                    hint: "Select your event category",
                    items: _categories,
                    selectedValueNotifier: _categoryNotifier,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Event category is required";
                      }
                    },
                  ),
                  SizedBox(height: 32.h),
                  CustomText(
                    text: "Event subcategory*",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(height: 14.h),
                  CommonFormDropdown(
                    hint: "Select your event subcategory",
                    items: _subCategories,
                    selectedValueNotifier: _subCategoryNotifier,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Event subcategory is required";
                      }
                    },
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
