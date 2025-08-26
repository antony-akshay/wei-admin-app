import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wei_admin/common_widgets/custom_inner_shadow_button.dart';
import 'package:wei_admin/core/app_colors.dart';
import 'package:wei_admin/features/create_event/presentation/widgets/event_preview_item_tile.dart';
import 'package:wei_admin/features/create_event/presentation/widgets/event_preview_item_tile_for_image.dart';

class LocationAndTypeTab extends StatelessWidget {
  const LocationAndTypeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
     padding: EdgeInsets.fromLTRB(20.w,42.h,20.w,10.h),
      child: Column(
        children: [
          EventPreviewItemTile(label: "Event type :", value: "Offline"),
          SizedBox(height: 24.h),
          EventPreviewItemTile(
            label: "Event location :",
            value: "Perinthalmanna, Malappuram",
          ),
          SizedBox(height: 24.h),
          EventPreviewItemTile(
            label: "Map location :",
            value: "JN road ,Perinthalmanna, Malappuram",
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
