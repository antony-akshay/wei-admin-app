import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wei_admin/common_widgets/custom_inner_shadow_button.dart';
import 'package:wei_admin/common_widgets/custom_inner_shadow_icon_button.dart';
import 'package:wei_admin/common_widgets/custom_text.dart';
import 'package:wei_admin/core/app_colors.dart';
import 'package:wei_admin/features/create_event/presentation/screens/tabs/add_on_events_tab.dart';
import 'package:wei_admin/features/create_event/presentation/screens/tabs/bank_details_tab.dart';
import 'package:wei_admin/features/create_event/presentation/screens/tabs/basic_details_tab.dart';
import 'package:wei_admin/features/create_event/presentation/screens/tabs/date_and_time_tab.dart';
import 'package:wei_admin/features/create_event/presentation/screens/tabs/group_details_tab.dart';
import 'package:wei_admin/features/create_event/presentation/screens/tabs/guest_details_tab.dart';
import 'package:wei_admin/features/create_event/presentation/screens/tabs/hashtags_tab.dart';
import 'package:wei_admin/features/create_event/presentation/screens/tabs/location_and_type_tab.dart';
import 'package:wei_admin/features/create_event/presentation/screens/tabs/media_tab.dart';
import 'package:wei_admin/features/create_event/presentation/screens/tabs/ticket_details_tab.dart';

class EventPreviewScreen extends StatelessWidget {
  const EventPreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 10,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 24.h),
                Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: Row(
                    children: [
                      CustomInnerShadowIconButton(
                        iconPath: "assets/icons/common/arrow_back.svg",
                        ontap: () => GoRouter.of(context).pop(),
                      ),
                      SizedBox(width: 8.w),
                      CustomText(
                        text: "Event preview",
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24.h),
                TabBar(
                  isScrollable: true,
                  indicatorColor: const Color(0xFF4A90E2),
                  indicatorWeight: 3,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.grey,
                  labelStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  unselectedLabelStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                  tabs: const [
                    Tab(text: 'Group details'),
                    Tab(text: 'Basic details'),
                    Tab(text: 'Location & type'),
                    Tab(text: 'Guest details'),
                    Tab(text: 'Date and time'),
                    Tab(text: 'Ticket details'),
                    Tab(text: 'Bank details'),
                    Tab(text: 'Hashtags'),
                    Tab(text: 'Media'),
                    Tab(text: 'Add on events'),
                  ],
                ),

                SizedBox(
                  height:
                      MediaQuery.of(context).size.height *
                      0.8, // Adjust height as needed
                  child: TabBarView(
                    children: [
                      GroupDetailsTab(),
                      BasicDetailsTab(),
                      LocationAndTypeTab(),
                      GuestDetailsTab(),
                      DateAndTimeTab(),
                      TicketDetailsTab(),
                      BankDetailsTab(),
                      HashtagsTab(),
                      MediaTab(),
                      AddOnEventsTab(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 66.h),
          child: Row(
            children: [
              Expanded(
                child: CustomInnerShadowButton(
                  ontap: () => GoRouter.of(context).pop(),
                  label: "Back",
                  backgroundColor: AppColors.tertiaryButtonColor,
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: CustomInnerShadowButton(
                  ontap: () {
                    // GoRouter.of(
                    //   context,
                    // ).pushNamed(AppRouteNames.guestYesOrNo);
                  },
                  label: "Next",
                  backgroundColor: AppColors.secondaryButtonColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
