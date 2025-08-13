import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:wei_admin/common_widgets/browse_files_card.dart';
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

class AddVisualsToYourEventScreen extends StatelessWidget {
  AddVisualsToYourEventScreen({super.key, required this.showProgress});
  final _formKey = GlobalKey<FormState>();
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
                      iconPath: "assets/icons/event/add_visuals.svg",
                      progress:showProgress? "Step 6/6":null,
                      title: "Add Visuals to Your Event",
                      description: "Upload photos, videos, or banners",
                    ),
                  ),
                  SizedBox(height: 32.h),
                  Row(
                    children: [
                      BrowseFilesCard(title: "Event logo*"),
                      SizedBox(width: 16.w),
                      BrowseFilesCard(title: "Banner image*"),
                    ],
                  ),
                  SizedBox(height: 32.h),
                  BrowseFilesCard(title: "Images and videos*"),
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
                              ).pushNamed(AppRouteNames.addOnEventsYesOrNo);
                            }
                          },
                          label: "Save and continue",
                          backgroundColor: AppColors.secondaryButtonColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 68.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
