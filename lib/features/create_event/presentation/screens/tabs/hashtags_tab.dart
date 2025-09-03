import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:wei_admin/common_widgets/custom_inner_shadow_button.dart';
import 'package:wei_admin/common_widgets/custom_text.dart';
import 'package:wei_admin/core/app_colors.dart';
import 'package:wei_admin/features/create_event/presentation/widgets/event_preview_item_tile.dart';
import 'package:wei_admin/routes/app_route_constants.dart';

class HashtagsTab extends StatelessWidget {
  HashtagsTab({super.key});

  final List<String> tags = [
    "Concert",
    "Music",
    "Dance",
    "Popular",
    "Trending",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 42.h, 20.w, 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Wrap(
            spacing: 9.w,
            runSpacing: 8.h,
            children: tags.map((tag) {
              return SizedBox(
                child: Container(
                  height: 36.h,
                  padding: EdgeInsets.fromLTRB(11.75.w, 6.h, 14.w, 6.h),
                  decoration: BoxDecoration(
                    color: const Color(0xFF249EFF),
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        "assets/icons/event/hash.svg",
                        height: 12.5.h,
                        width: 12.5.h,
                      ),
                      SizedBox(width: 9.75.w),
                      CustomText(text: tag, fontSize: 14.sp),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),

          SizedBox(height: 64.h),
          Align(
            child: CustomInnerShadowButton(
              height: 32.w,
              width: 100.w,
              ontap: () =>
                  GoRouter.of(context).pushNamed(AppRouteNames.addHashtags),
              label: "Edit",
              suffixIconPath: "assets/icons/common/edit_pencil.svg",
              backgroundColor: AppColors.tertiaryButtonColor,
            ),
          ),
        ],
      ),
    );
  }
}
