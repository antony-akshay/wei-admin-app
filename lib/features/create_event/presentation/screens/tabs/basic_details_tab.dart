import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wei_admin/common_widgets/custom_inner_shadow_button.dart';
import 'package:wei_admin/core/app_colors.dart';
import 'package:wei_admin/features/create_event/presentation/widgets/event_preview_item_tile.dart';
import 'package:wei_admin/routes/app_route_constants.dart';

class BasicDetailsTab extends StatelessWidget {
  const BasicDetailsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 42.h, 20.w, 10.h),
      child: Column(
        children: [
          EventPreviewItemTile(
            label: "Event name :",
            value: "Bellie Eillish concert",
          ),
          SizedBox(height: 24.h),
          EventPreviewItemTile(label: "Event category :", value: "Music"),
          SizedBox(height: 24.h),
          EventPreviewItemTile(label: "Event subcategory :", value: "Concert"),
          SizedBox(height: 24.h),
          EventPreviewItemTile(
            label: "Event description :",
            value:
                "Billie Eilish Pirate Baird O'Connell is an American singer-songwriter and musician. She first gained public attention in 2015 with her debut single "
                'Ocean Eyes'
                ", written and produced by her brother Finneas O'Connell.",
          ),

          SizedBox(height: 64.h),
          CustomInnerShadowButton(
             height: 32.w,
            width: 100.w,
            ontap: () => GoRouter.of(context).pushNamed(AppRouteNames.eventBasics),
            label: "Edit",
            suffixIconPath: "assets/icons/common/edit_pencil.svg",
            backgroundColor: AppColors.tertiaryButtonColor,
          ),
        ],
      ),
    );
  }
}
