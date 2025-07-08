import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wei_admin/common_widgets/custom_inner_shadow_icon_button.dart';
import 'package:wei_admin/common_widgets/custom_text.dart';
import 'package:wei_admin/common_widgets/search_textfield.dart';
import 'package:wei_admin/core/app_colors.dart';
import 'package:wei_admin/features/chat/presentation/widgets/pageview_tile.dart';


class MessagesScreen extends StatefulWidget {
  MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              Row(
                children: [
                  CustomInnerShadowIconButton(
                    height: 36.w,
                    width: 36.w,
                    iconPath: "assets/icons/common/arrow_back.svg",
                  ),
                  SizedBox(width: 10.w),
                  CustomText(
                    text: "Messages",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(width: 4.w),
                  CustomText(
                    text: "(8)",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    fontColor: AppColors.secondaryButtonColor,
                  ),
                  Spacer(),
                  SvgPicture.asset("assets/icons/chat/edit.svg"),
                  SizedBox(width: 26.w),
                  SvgPicture.asset("assets/icons/chat/settings.svg"),
                ],
              ),

              SizedBox(height: 24.h),
              SearchTextfield(width: double.infinity),
              SizedBox(height: 24.h),
            ],
          ),
        ),

        // page view section
        Expanded(child: PageviewTile()),

        // SizedBox(height: 8.h),
      ],
    );
  }
}
