import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wei_admin/common_widgets/custom_inner_shadow_icon_button.dart';
import 'package:wei_admin/common_widgets/custom_text.dart';
import 'package:wei_admin/features/profile/widgets/color_button.dart';
import 'package:wei_admin/features/profile/widgets/grey_button.dart';
import 'package:wei_admin/features/settings/widgets/settings_textfield.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  TextEditingController websiteController = TextEditingController();

  String? emptyFieldValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: CustomInnerShadowIconButton(
                      iconPath: "assets/icons/common/arrow_back.svg",
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Edit profile',
                          style: GoogleFonts.urbanist(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          'Make it yours! Edit your name, bio, photo, and more to reflect the real you.',
                          style: GoogleFonts.urbanist(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(129, 129, 129, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      CircleAvatar(radius: 75 / 2),
                      SizedBox(height: 10,),
                      CustomText(
                        text: 'Change profile photo',
                        fontColor: Colors.blue,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10,),
              CustomText(
                text: 'Website',
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(height: 15.h),
              SettingsTextfield(
                controller: websiteController,
                hintText: '',
                validator: emptyFieldValidator,
              ),
              SizedBox(height: 30.h),
              CustomText(text: 'Name', fontSize: 16, fontWeight: FontWeight.w400),
              SizedBox(height: 15.h),
              SettingsTextfield(
                controller: websiteController,
                hintText: '',
                validator: emptyFieldValidator,
              ),
              SizedBox(height: 30.h),
              CustomText(
                text: 'Username',
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(height: 15.h),
              SettingsTextfield(
                controller: websiteController,
                hintText: '',
                validator: emptyFieldValidator,
              ),
              SizedBox(height: 30.h),
              CustomText(text: 'Bio', fontSize: 16, fontWeight: FontWeight.w400),
              SizedBox(height: 15.h),
              SettingsTextfield(
                controller: websiteController,
                hintText: '',
                validator: emptyFieldValidator,
              ),
              SizedBox(height: 50.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GreyButton(
                    label: 'Back',
                    width: 167,
                    height: 42,
                    onTap: () => Navigator.pop(context),
                  ),
                  ColorButton(
                    label: 'Verify',
                    width: 167,
                    height: 42,
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
