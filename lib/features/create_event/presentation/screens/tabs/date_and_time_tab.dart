import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wei_admin/common_widgets/custom_inner_shadow_button.dart';
import 'package:wei_admin/core/app_colors.dart';
import 'package:wei_admin/features/create_event/presentation/widgets/event_preview_item_tile.dart';

class DateAndTimeTab extends StatelessWidget {
  const DateAndTimeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 42.h, 20.w, 10.h),
      child: Column(
        children: [
          EventPreviewItemTile(label: "Date type :", value: "Multi days"),
          SizedBox(height: 24.h),
          EventPreviewItemTile(label: "Start date :", value: "20 AUG 2025"),
          SizedBox(height: 24.h),
          EventPreviewItemTile(label: "End date :", value: "18 SPET 2025"),
          SizedBox(height: 24.h),
          EventPreviewItemTile(
            label: "Event Time :",
            value: "6:00 AM - 8:00 PM",
          ),

          SizedBox(height: 64.h),
          CustomInnerShadowButton(
             height: 32.w,
            width: 100.w,
            ontap: () => GoRouter.of(context).pop(),
            label: "Edit",
            suffixIconPath: "assets/icons/common/edit_pencil.svg",
            backgroundColor: AppColors.tertiaryButtonColor,
          ),
        ],
      ),
    );
  }
}
