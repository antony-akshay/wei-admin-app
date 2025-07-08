import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wei_admin/core/app_colors.dart';
import 'package:wei_admin/screens/chat/chat_screen.dart';
import 'package:wei_admin/screens/common_widgets/custom_text.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.imagePath,
    required this.name,
    required this.lastMessage,
    required this.messageCount,
    required this.time,
  });

  final String imagePath;
  final String name;
  final String lastMessage;
  final int messageCount;
  final String time;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Tapped");
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>
                ChatScreen(profilePicPath: imagePath, name: name),
          ),
        );
      },
      child: Container(
        color: Colors.transparent,
        height: 58.h,
        child: Row(
          children: [
            CircleAvatar(
              radius: 29.w,
              backgroundImage: NetworkImage(imagePath),
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
                  text: lastMessage,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  fontColor: messageCount != 0
                      ? AppColors.mainFontColor
                      : AppColors.secondaryFontColor,
                ),
              ],
            ),
            Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: time,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  fontColor: messageCount != 0
                      ? AppColors.mainFontColor
                      : AppColors.secondaryFontColor,
                ),
                SizedBox(height: 3.h),
                messageCount != 0
                    ? CircleAvatar(
                        radius: 10.h,
                        backgroundColor: AppColors.secondaryButtonColor,
                        child: CustomText(
                          text: messageCount.toString(),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    : CircleAvatar(
                        radius: 10.r,
                        backgroundColor: Colors.transparent,
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
