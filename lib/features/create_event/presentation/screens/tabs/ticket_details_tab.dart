import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:wei_admin/common_widgets/custom_inner_shadow_button.dart';
import 'package:wei_admin/core/app_colors.dart';
import 'package:wei_admin/features/chat/presentation/widgets/gradient_divider.dart';
import 'package:wei_admin/features/create_event/presentation/widgets/event_preview_item_tile.dart';

class TicketDetailsTab extends StatelessWidget {
  const TicketDetailsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 42.h, 20.w, 10.h),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(12.r),
                child: Container(
                  height: 92.w,
                  width: 92.w,
                  child: Image(
                    image: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSm_qmS1YUEB99EzEQWGuHbXGLArMqWwcQ-tA&s",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 220.w,
                    child: EventPreviewItemTile(
                      label: "Ticket type :",
                      value: "Platinum",
                    ),
                  ),
                  SizedBox(height: 12.h),
                  SizedBox(
                    width: 220.w,
                    child: EventPreviewItemTile(
                      label: "Ticket price :",
                      value: "\$1000",
                    ),
                  ),
                ],
              ),
              Spacer(),
              SvgPicture.asset("assets/icons/common/right_arrow.svg"),
            ],
          ),
          SizedBox(height: 24.h),
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(12.r),
                child: Container(
                  height: 92.w,
                  width: 92.w,
                  child: Image(
                    image: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSm_qmS1YUEB99EzEQWGuHbXGLArMqWwcQ-tA&s",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 220.w,
                    child: EventPreviewItemTile(
                      label: "Ticket type :",
                      value: "Gold",
                    ),
                  ),
                  SizedBox(height: 12.h),
                  SizedBox(
                    width: 220.w,
                    child: EventPreviewItemTile(
                      label: "Ticket price :",
                      value: "\$500",
                    ),
                  ),
                ],
              ),
              Spacer(),
              SvgPicture.asset("assets/icons/common/right_arrow.svg"),
            ],
          ),
          SizedBox(height: 24.h),
          GradientDivider(),
          SizedBox(height: 24.h),
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(12.r),
                child: Container(
                  height: 145.w,
                  width: 350.w,
                  child: Image(
                    image: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvFRsTsODibBzbsBDz2ruWHFHD8_OoTY4yNQ&s",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 8.w,
                right: 8.w,
                child: CustomInnerShadowButton(
                  height: 32.w,
                  width: 100.w,
                  label: "Reupload",
                  suffixIconPath: "assets/icons/common/edit_pencil.svg",
                  backgroundColor: AppColors.tertiaryButtonColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
