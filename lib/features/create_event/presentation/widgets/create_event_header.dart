import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wei_admin/common_widgets/custom_inner_shadow_icon_button.dart';
import 'package:wei_admin/common_widgets/custom_text.dart';

class CreateEventHeader extends StatelessWidget {
  const CreateEventHeader({super.key, this.title});
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomInnerShadowIconButton(
          iconPath: "assets/icons/common/arrow_back.svg",
          ontap: () => GoRouter.of(context).pop(),
        ),
        SizedBox(width: 8.w),
        CustomText(
          text: title ?? "Create event",
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
        ),
      ],
    );
  }
}
