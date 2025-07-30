import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:wei_admin/common_widgets/custom_inner_shadow_button.dart';
import 'package:wei_admin/common_widgets/custom_inner_shadow_icon_button.dart';
import 'package:wei_admin/common_widgets/custom_text.dart';
import 'package:wei_admin/core/app_colors.dart';
import 'package:wei_admin/features/create_event/presentation/widgets/add_on_events_item_tile.dart';
import 'package:wei_admin/features/create_event/presentation/widgets/create_event_header.dart';
import 'package:wei_admin/features/create_event/presentation/widgets/top_section_card.dart';
import 'package:wei_admin/routes/app_route_constants.dart';

class AddOnEventsManagingScreen extends StatelessWidget {
  AddOnEventsManagingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24.h),
                CreateEventHeader(),
                SizedBox(height: 24.h),
                Center(
                  child: TopSectionCard(
                    iconPath: "assets/icons/event/add_on.svg",
                    title: "Add on events",
                    description: "Add the needed details of each add-on events",
                  ),
                ),
                SizedBox(height: 70.h),
                AddOnEventsItemTile(label: "Add basic details"),
                SizedBox(height: 24.h),
                AddOnEventsItemTile(label: "Add date and time"),
                SizedBox(height: 24.h),
                AddOnEventsItemTile(label: "Add location"),
                SizedBox(height: 24.h),
                AddOnEventsItemTile(label: "Add ticket details"),
                SizedBox(height: 24.h),
                AddOnEventsItemTile(label: "Add bank details"),
                SizedBox(height: 24.h),
                AddOnEventsItemTile(label: "Add guide details"),
                SizedBox(height: 24.h),
                AddOnEventsItemTile(label: "Add hashtags"),
                SizedBox(height: 24.h),
                AddOnEventsItemTile(label: "Add event description"),
                SizedBox(height: 24.h),
                AddOnEventsItemTile(label: "Add event media"),
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
                          // GoRouter.of(
                          //   context,
                          // ).pushNamed(AppRouteNames.addOnEventsYesOrNo);
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
    );
  }
}
