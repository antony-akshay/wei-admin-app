import 'package:flutter/material.dart';
import 'package:flutter_inner_shadow/flutter_inner_shadow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:wei_admin/common_widgets/custom_inner_shadow_icon_button.dart';
import 'package:wei_admin/common_widgets/custom_text.dart';
import 'package:wei_admin/core/app_colors.dart';
import 'package:wei_admin/features/chat/presentation/widgets/chat_message_tile.dart';


class ChatScreen extends StatelessWidget {
  ChatScreen({super.key, required this.profilePicPath, required this.name});
  final String profilePicPath;
  final String name;

  final List chatMessages = [
    {
      "isUser": false,
      "message":
          "tthe plural of the Latin word illuminatus, meaning “enlightened”—is a name that has been in use since the late 15th century and has been applied to various groups since ",
    },
    {"isUser": false, "message": "tthe plural of the Latin word illuminatus"},
    {
      "isUser": true,
      "message":
          "tthe plural of the Latin word illuminatus, meaning “enlightened”—is a name that has been in use since the late 15th century and has been applied to various groups since ",
    },
    {"isUser": true, "message": "tthe plural of the Latin word"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(30.h + 58.w),
        child: Column(
          children: [
            SizedBox(height: 45.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                children: [
                  CustomInnerShadowIconButton(
                    ontap: () => GoRouter.of(context).pop(),
                    height: 36.w,
                    width: 36.w,
                    iconPath: "assets/icons/common/arrow_back.svg",
                  ),
                  SizedBox(width: 16.w),
                  CircleAvatar(
                    radius: 29.w,
                    backgroundImage: NetworkImage(profilePicPath),
                  ),
                  SizedBox(width: 8.w),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: name,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(height: 3.h),
                      CustomText(
                        text: "Online",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        fontColor: AppColors.secondaryFontColor,
                      ),
                    ],
                  ),
                  Spacer(),
                  CustomInnerShadowIconButton(
                    height: 36.w,
                    width: 36.w,
                    iconPath: "assets/icons/common/menu_dots.svg",
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            Container(
              height: 1.h,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Colors.white.withAlpha(0),
                    Colors.white,
                    Colors.white.withAlpha(0),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView.builder(
          itemCount: chatMessages.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: ChatMessageTile(
                isUser: chatMessages[index]["isUser"],
                message: chatMessages[index]["message"],
              ),
            );
          },
        ),
      ),

      bottomNavigationBar: Builder(
        builder: (context) {
          final bottomInset = MediaQuery.of(context).viewInsets.bottom;
          final double bottomPadding = bottomInset > 0
              ? bottomInset + 5.h
              : 51.h;
          return Padding(
            padding: EdgeInsets.only(
              left: 20.w,
              right: 20.w,
              bottom: bottomPadding,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50.r),
                  child: InnerShadow(
                    shadows: [
                      BoxShadow(
                        color: Colors.black.withAlpha(46),
                        offset: Offset(-6, -6),
                        blurRadius: 12,
                      ),
                      BoxShadow(
                        color: Colors.white.withAlpha(20),
                        offset: Offset(6, 6),
                        blurRadius: 12,
                      ),
                    ],
                    child: Container(
                      height: 64.w,
                      width: 278.w,
                      decoration: BoxDecoration(
                        color: AppColors.backgroundColor,
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(left: 22.w, right: 22.w),
                      child: Row(
                        children: [
                          SvgPicture.asset("assets/icons/chat/sticker.svg"),
                          SizedBox(width: 10.w),
                          SizedBox(
                            width: 125.w,
                            child: TextFormField(
                              decoration: InputDecoration(
                                isCollapsed: true,
                                border: InputBorder.none,
                                hintText: 'Type here...',
                                hintStyle: TextStyle(
                                  color: Colors.white.withOpacity(0.5),
                                ),
                              ),
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Spacer(),
                          SvgPicture.asset("assets/icons/chat/attachment.svg"),
                          SizedBox(width: 25.w),
                          SvgPicture.asset("assets/icons/chat/photo.svg"),
                        ],
                      ),
                    ),
                  ),
                ),
                CustomInnerShadowIconButton(
                  height: 64.w,
                  width: 64.w,
                  iconPath: "assets/icons/chat/mic.svg",
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
