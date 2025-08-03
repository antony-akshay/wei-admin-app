import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wei_admin/common_widgets/custom_inner_shadow_icon_button.dart';
import 'package:wei_admin/common_widgets/custom_text.dart';
import 'package:wei_admin/features/buildteam/widgets/buildteam_dropdown.dart';
import 'package:wei_admin/features/profile/widgets/color_button.dart';
import 'package:wei_admin/common_widgets/grey_button.dart';
import 'package:wei_admin/features/settings/widgets/settings_textfield.dart';

class PersonalDetailsScreen extends StatelessWidget {
  PersonalDetailsScreen({super.key});

  TextEditingController _nameController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _secondaryemailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  List<String> _genderType = ["male", "female"];
  final ValueNotifier<String?> dropdownValue = ValueNotifier<String?>(null);

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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
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
                            'Personal details',
                            style: GoogleFonts.urbanist(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            'Some your info stays private and won’t be shown publicly.',
                            style: GoogleFonts.urbanist(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(129, 129, 129, 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              ClipOval(
                                child: Image.asset(
                                  'assets/images/test-photo.jpg',
                                  width: 76.r,
                                  height: 76.r,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                bottom: -4,
                                right: -4,
                                child: GestureDetector(
                                  onTap: () => {},
                                  child: CircleAvatar(
                                    radius: 14,
                                    backgroundColor: Color.fromRGBO(
                                      94,
                                      92,
                                      230,
                                      1,
                                    ),
                                    child: SvgPicture.asset(
                                      'assets/icons/settings/camera.svg',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: 'Emma Raducanu',
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                              CustomText(
                                text: '@emma_2255',
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontColor: Color.fromRGBO(129, 129, 129, 1),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      CustomText(
                        text: 'Name',
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                      SizedBox(height: 10),
                      SettingsTextfield(
                        controller: _nameController,
                        hintText: 'name',
                        validator: emptyFieldValidator,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Help people discover your account by using the name you\'re known by: either your full name, nickname, or business name.',
                        style: GoogleFonts.urbanist(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(129, 129, 129, 1),
                        ),
                        textAlign: TextAlign.start, // optional
                      ),
                      SizedBox(height: 5),
                      Text(
                        'You can only change your name twice within 14 days.',
                        style: GoogleFonts.urbanist(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(129, 129, 129, 1),
                        ),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(height: 10),
                      CustomText(
                        text: 'Username',
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                      SizedBox(height: 10),
                      SettingsTextfield(
                        controller: _usernameController,
                        hintText: 'username',
                        validator: emptyFieldValidator,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'In most cases, you\'ll be able to change your username back to sanGeeth2255 for another 14 days.',
                        style: GoogleFonts.urbanist(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(129, 129, 129, 1),
                        ),
                        textAlign: TextAlign.start, // optional
                      ),
                      SizedBox(height: 10),
                      CustomText(
                        text: 'Email',
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                      SizedBox(height: 10),
                      SettingsTextfield(
                        controller: _emailController,
                        hintText: 'email@email.com',
                        validator: emptyFieldValidator,
                      ),
                      SizedBox(height: 10),
                      CustomText(
                        text: 'Secondary email',
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                      SizedBox(height: 10),
                      SettingsTextfield(
                        controller: _secondaryemailController,
                        hintText: 'email@email.com',
                        validator: emptyFieldValidator,
                      ),
                      SizedBox(height: 10),
                      CustomText(
                        text: 'Phone',
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                      SizedBox(height: 10),
                      SettingsTextfield(
                        controller: _phoneController,
                        hintText: '9090909090',
                        validator: emptyFieldValidator,
                      ),
                      SizedBox(height: 10),
                      CustomText(
                        text: 'Address',
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                      SizedBox(height: 10),
                      SettingsTextfield(
                        controller: _addressController,
                        hintText: 'XYZ',
                        validator: emptyFieldValidator,
                      ),
                      SizedBox(height: 10),
                      CustomText(
                        text: 'Gender',
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                      SizedBox(height: 10),
                      BuildteamDropdown(
                        items: _genderType,
                        selectedValueNotifier: dropdownValue,
                        hint: 'prefer no to say',
                      ),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GreyButton(label: 'Cancel', width: 167, height: 42),
                          ColorButton(label: 'Save', width: 167, height: 42),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
