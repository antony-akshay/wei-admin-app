import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:wei_admin/common_widgets/common_form_textfield.dart';
import 'package:wei_admin/common_widgets/custom_inner_shadow_button.dart';
import 'package:wei_admin/common_widgets/custom_text.dart';
import 'package:wei_admin/core/app_colors.dart';

class EditGuestScreen extends StatelessWidget {
  EditGuestScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _linkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 350.w,
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 24.h),
          decoration: BoxDecoration(
            color: AppColors.modalColor,
            borderRadius: BorderRadius.circular(24.r),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      CircleAvatar(radius: 42.w),
                      Positioned(
                        right: -3.w,
                        bottom: -3.w,
                        child: CircleAvatar(
                          radius: 16.w,
                          backgroundColor: AppColors.mainFontColor,
                          child: CircleAvatar(
                            child: CircleAvatar(
                              radius: 15.w,
                              backgroundColor: AppColors.secondaryButtonColor,
                              child: SvgPicture.asset(
                                "assets/icons/common/edit_pencil.svg",
                                height: 12.w,
                                width: 12.w,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 38.h),
                CustomText(
                  text: "Guest name*",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(height: 14.h),
                CommonFormTextfield(
                  controller: _nameController,
                  hint: "Enter your guest name",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Guest name is required";
                    }
                  },
                ),
                SizedBox(height: 32.h),
                CustomText(
                  text: "Profile link",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(height: 14.h),
                CommonFormTextfield(
                  controller: _linkController,
                  hint: "Enter any social media links",
                ),

                SizedBox(height: 89.h),
                Row(
                  children: [
                    Expanded(
                      child: CustomInnerShadowButton(
                        ontap: () => GoRouter.of(context).pop(),
                        label: "Cancel",
                        backgroundColor: AppColors.tertiaryButtonColor,
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: CustomInnerShadowButton(
                        ontap: () {
                          if (_formKey.currentState!.validate()) {}
                        },
                        label: "Save changes",
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
