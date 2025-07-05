import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wei_admin/core/app_colors.dart';
import 'package:wei_admin/screens/common_widgets/custom_text.dart';

class ChatMessageTile extends StatelessWidget {
  const ChatMessageTile({
    super.key,
    required this.isUser,
    required this.message,
  });

  final bool isUser;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: isUser
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: [
        Container(
          constraints: BoxConstraints(maxWidth: 299.w),
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
              bottomLeft: isUser ? Radius.circular(20.r) : Radius.circular(0),
              bottomRight: isUser ? Radius.circular(0) : Radius.circular(20.r),
            ),
            color: isUser ? AppColors.secondaryButtonColor : Color(0xFF3D3D3D),
          ),
          child: CustomText(
            text: message,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            height: 20.sp / 14.sp,
          ),
        ),
        SizedBox(height: 8.h),
        CustomText(
          text: "12:00PM",
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          height: 20.sp / 14.sp,
        ),
      ],
    );
  }
}
