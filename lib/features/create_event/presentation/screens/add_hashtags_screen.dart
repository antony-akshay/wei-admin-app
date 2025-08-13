import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:wei_admin/common_widgets/common_form_textfield.dart';
import 'package:wei_admin/common_widgets/custom_inner_shadow_button.dart';
import 'package:wei_admin/common_widgets/custom_text.dart';
import 'package:wei_admin/core/app_colors.dart';
import 'package:wei_admin/features/buildteam/widgets/search_field.dart';
import 'package:wei_admin/features/create_event/presentation/widgets/create_event_header.dart';
import 'package:wei_admin/features/create_event/presentation/widgets/top_section_card.dart';
import 'package:wei_admin/routes/app_route_constants.dart';

class AddHashtagsScreen extends StatefulWidget {
  const AddHashtagsScreen({super.key});

  @override
  State<AddHashtagsScreen> createState() => _AddHashtagsScreenState();
}

class _AddHashtagsScreenState extends State<AddHashtagsScreen> {
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _hashtagController = TextEditingController();
  List<String> tags = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                    iconPath: "assets/icons/event/hash.svg",
                    title: "Tag the vibe!",
                    description: "Drop in hashtags to get your event noticed.",
                  ),
                ),
                if (tags.isNotEmpty)
                  SizedBox(
                    height: 42.h,
                  ), // dont have to show empty space when no list is there
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: tags.map((tag) {
                    return SizedBox(
                      height: tags.isEmpty ? 0 : 58.h,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            height: 36.h,
                            padding: EdgeInsets.fromLTRB(
                              11.75.w,
                              6.h,
                              14.w,
                              6.h,
                            ),
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
                          Positioned(
                            top: -11.h,
                            right: -3.h,
                            child: GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () => setState(() {
                                log("removing $tag");
                                tags.remove(tag);
                              }),
                              child: CircleAvatar(
                                radius: 12.h,
                                backgroundColor: AppColors.deleteColor,
                                child: Icon(
                                  Icons.close_rounded,
                                  size: 16.h,
                                  color: AppColors.mainFontColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),

                SizedBox(height: 32.h),
                SearchField(
                  width: double.infinity,
                  hint: "Search popular tags",
                  searchController: _searchController,
                ),
                SizedBox(height: 32.h),
                CustomText(
                  text: "Hashtags",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(height: 14.h),
                CommonFormTextfield(
                  controller: _hashtagController,
                  hint: "Enter hashtags to highlight your event",
                ),
                SizedBox(height: 32.h),
                GestureDetector(
                  onTap: () => setState(() {
                    if (_hashtagController.text.trim().isNotEmpty) {
                      tags.add(_hashtagController.text);
                    }
                  }),
                  child: Container(
                    height: 50.h,

                    decoration: BoxDecoration(
                      color: Color(0xFF606060),
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          text: "Add tag",
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 84.h),
                Row(
                  children: [
                    Expanded(
                      child: CustomInnerShadowButton(
                        ontap: () => GoRouter.of(context).pop(),
                        label: "Go back",
                        backgroundColor: AppColors.tertiaryButtonColor,
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: CustomInnerShadowButton(
                        ontap: () {
                          GoRouter.of(
                            context,
                          ).pushNamed(AppRouteNames.guestYesOrNo);
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
