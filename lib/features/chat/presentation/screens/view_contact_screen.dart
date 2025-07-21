import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:wei_admin/common_widgets/custom_inner_shadow_button.dart';
import 'package:wei_admin/common_widgets/custom_inner_shadow_icon_button.dart';
import 'package:wei_admin/common_widgets/custom_text.dart';
import 'package:wei_admin/core/app_colors.dart';
import 'package:wei_admin/features/chat/presentation/widgets/gradient_divider.dart';
import 'package:wei_admin/features/chat/presentation/widgets/members_list_tile.dart';

class ViewContactScreen extends StatelessWidget {
  ViewContactScreen({super.key, this.isGroup = true});

  final bool? isGroup;

  final membersList = [
    {
      "profilePic":
          "https://images.unsplash.com/photo-1554151228-14d9def656e4?q=80&w=1972&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "name": "You",
      "username": "@sang_eeth",
      "type": "Admin",
    },
    {
      "profilePic":
          "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "name": "KA",
      "username": "@khureshi_666",
      "type": "Collaborator",
    },
    {
      "profilePic":
          "https://images.unsplash.com/photo-1554151228-14d9def656e4?q=80&w=1972&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "name": "Zaeyd masood",
      "username": "@zayed_masood",
      "type": "Editor",
    },
    {
      "profilePic":
          "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "name": "Sachin tendulker",
      "username": "@sachin_10_dulker",
      "type": "Coordinator",
    },
    {
      "profilePic":
          "https://images.unsplash.com/photo-1554151228-14d9def656e4?q=80&w=1972&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "name": "Sara tendulker",
      "username": "@sara_10_dulker",
      "type": "Viewer",
    },
  ];

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 11.h),
                      child: CustomInnerShadowIconButton(
                        ontap: () => GoRouter.of(context).pop(),
                        height: 36.w,
                        width: 36.w,
                        iconPath: "assets/icons/common/arrow_back.svg",
                      ),
                    ),
                    Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(50.r),
                          child: SizedBox(
                            height: 90.w,
                            width: 90.w,
                            child: Image(
                              image: NetworkImage(
                                "https://images.unsplash.com/photo-1554151228-14d9def656e4?q=80&w=1972&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 8.h),
                        CustomText(
                          text: isGroup == true
                              ? "Luciferian nexus"
                              : "Emma raducanu",
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(height: 4.h),
                        CustomText(
                          text: isGroup == true ? "10 members" : "@emma_2255",
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          fontColor: AppColors.secondaryFontColor,
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 11.h),
                      child: CustomInnerShadowIconButton(
                        ontap: () {},
                        height: 36.w,
                        width: 36.w,
                        iconPath: "assets/icons/common/menu_dots.svg",
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                if (isGroup == true)
                  Align(
                    alignment: Alignment.center,
                    child: CustomInnerShadowButton(
                      width: 170.w,
                      iconPath: "assets/icons/common/add.svg",
                      label: "Invite members",
                      backgroundColor: Color(0xFF44444D),
                    ),
                  )
                else
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomInnerShadowButton(
                        width: 170.w,
                        iconPath: "assets/icons/common/add.svg",
                        label: "Invite as collaborator",
                        backgroundColor: Color(0xFF44444D),
                        borderRadius: 80,
                      ),
                      CustomInnerShadowButton(
                        width: 170.w,
                        iconPath: "assets/icons/common/add.svg",
                        label: "Invite as coordinator",
                        backgroundColor: Color(0xFF44444D),
                      ),
                    ],
                  ),
                SizedBox(height: 26.h),
                GradientDivider(),
                SizedBox(height: 16.h),
                CustomText(
                  text:
                      "🌍 Exploring the world, one flight at a time\n📍Currently: [Your Current Location]",
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  fontColor: AppColors.secondaryFontColor,
                ),
                SizedBox(height: 4.h),
                CustomText(
                  text: "Read more",
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: 16.h),
                GradientDivider(),
                SizedBox(height: 16.h),
                if (isGroup == true) ...[
                  Row(
                    children: [
                      CustomText(
                        text: "10 members",
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        fontColor: AppColors.secondaryFontColor,
                      ),
                      Spacer(),

                      SvgPicture.asset(
                        "assets/icons/common/white_search.svg",
                        height: 18.sp,
                        width: 18.sp,
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  Column(
                    children: List.generate(5, (index) {
                      final member = membersList[index];
                      return Padding(
                        padding: EdgeInsets.only(bottom: index != 4 ? 12.h : 0),
                        child: MembersListTile(member: member),
                      );
                    }),
                  ),
                  SizedBox(height: 18.h),
                  Padding(
                    padding: EdgeInsets.only(left: 60.w),
                    child: CustomText(
                      text: "View all members(5)",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      fontColor: AppColors.secondaryButtonColor,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  GradientDivider(),
                  SizedBox(height: 24.h),
                ],

                Row(
                  children: [
                    CustomText(
                      text: "Media, Links, and docs",
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      fontColor: AppColors.secondaryFontColor,
                    ),
                    Spacer(),
                    CustomText(
                      text: "20",
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      fontColor: AppColors.secondaryFontColor,
                    ),
                    SizedBox(width: 16.w),
                    SvgPicture.asset("assets/icons/common/forward_arrow.svg"),
                  ],
                ),
                SizedBox(height: 16.h),
                SizedBox(
                  height: 75.w,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (index, context) {
                      return Padding(
                        padding: EdgeInsets.only(right: 16.w),
                        child: ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(12.r),
                          child: SizedBox(
                            height: 75.w,
                            width: 75.w,
                            child: Image(
                              image: NetworkImage(
                                "https://images.unsplash.com/photo-1554151228-14d9def656e4?q=80&w=1972&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 16.h),
                GradientDivider(),
                SizedBox(height: 19.h),
                Row(
                  children: [
                    SvgPicture.asset("assets/icons/chat/bell.svg"),
                    SizedBox(width: 10.w),
                    CustomText(
                      text: "Notifications",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    Spacer(),
                    Switch(value: true, onChanged: (value) {}),
                  ],
                ),
                SizedBox(height: 24.h),

                if (isGroup == true)
                  Column(
                    children: [
                      RedActionText(
                        onTap: () {},
                        iconPath: "assets/icons/chat/exit.svg",
                        text: "Exit group",
                      ),
                      SizedBox(height: 24.h),
                      RedActionText(
                        onTap: () {},
                        iconPath: "assets/icons/chat/report.svg",
                        text: "Report group",
                      ),
                    ],
                  )
                else
                  Column(
                    children: [
                      RedActionText(
                        onTap: () {},
                        iconPath: "assets/icons/chat/block.svg",
                        text: "Block Emma raducanu",
                      ),
                      SizedBox(height: 24.h),
                      RedActionText(
                        onTap: () {},
                        iconPath: "assets/icons/chat/report.svg",
                        text: "Report Emma raducanu",
                      ),
                    ],
                  ),

                SizedBox(height: 40.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RedActionText extends StatelessWidget {
  const RedActionText({
    super.key,
    required this.onTap,
    required this.iconPath,
    required this.text,
  });

  final String iconPath, text;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          SvgPicture.asset(iconPath),
          SizedBox(width: 10.w),
          CustomText(
            text: text,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            fontColor: AppColors.deleteColor,
          ),
        ],
      ),
    );
  }
}
