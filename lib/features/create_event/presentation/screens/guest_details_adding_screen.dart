import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:wei_admin/common_widgets/browse_files_card.dart';
import 'package:wei_admin/common_widgets/common_form_dropdown.dart';
import 'package:wei_admin/common_widgets/common_form_textfield.dart';
import 'package:wei_admin/common_widgets/custom_inner_shadow_button.dart';
import 'package:wei_admin/common_widgets/custom_inner_shadow_icon_button.dart';
import 'package:wei_admin/common_widgets/custom_text.dart';
import 'package:wei_admin/core/app_colors.dart';
import 'package:wei_admin/features/create_event/presentation/screens/add_on_events_managing_screen.dart';
import 'package:wei_admin/features/create_event/presentation/widgets/create_event_header.dart';
import 'package:wei_admin/features/create_event/presentation/widgets/top_section_card.dart';
import 'package:wei_admin/routes/app_route_constants.dart';

class GuestDetailsAddingScreen extends StatefulWidget {
  GuestDetailsAddingScreen({super.key});

  @override
  State<GuestDetailsAddingScreen> createState() =>
      _GuestDetailsAddingScreenState();
}

class _GuestDetailsAddingScreenState extends State<GuestDetailsAddingScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _guestNameController = TextEditingController();

  final TextEditingController _profileLinkController = TextEditingController();

  final bool isAddedMultipleGuests = false;
  List<String> guests = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 24.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child:   CreateEventHeader(),
              ),
              SizedBox(height: 24.h),
              TopSectionCard(
                iconPath: "assets/icons/event/guest_details.svg",
                progress: "Step 3/6",
                title: "Guest details",
                description: "Add your guest name, photo and profile links",
              ),
              if (guests.isNotEmpty)
                SizedBox(
                  height: 42.h,
                ), // dont have to show empty space when no list is there
              SizedBox(
                height: guests.isEmpty ? 0 : 58.h,
                child: ListView.builder(
                  itemCount: guests.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                        left: index == 0 ? 20.w : 0,
                        right: 20.w,
                        top: 6.h,
                      ),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          GestureDetector(
                            onTap: () => GoRouter.of(
                              context,
                            ).pushNamed(AppRouteNames.editGuest),
                            child: Container(
                              height: 52.h,
                              decoration: BoxDecoration(
                                color: AppColors.tertiaryButtonColor,
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 30.w,
                                  ),
                                  child: CustomText(
                                    text: guests[index],
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: -6.h,
                            right: -6.h,
                            child: GestureDetector(
                              onTap: () => setState(() {
                                guests.removeAt(index);
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
                  },
                ),
              ),

              SizedBox(height: 32.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "Guest name*",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      SizedBox(height: 14.h),
                      CommonFormTextfield(
                        controller: _guestNameController,
                        hint: "Enter your guest name",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Guest name is required";
                          }
                        },
                      ),
                      SizedBox(height: 32.h),
                      CustomText(
                        text: "Guest profile link",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      SizedBox(height: 14.h),
                      CommonFormTextfield(
                        controller: _profileLinkController,
                        hint: "Enter any social media links",
                      ),
                      SizedBox(height: 32.h),

                      BrowseFilesCard(title: "Guest image"),
                      SizedBox(height: 32.h),
                      GestureDetector(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              guests.add(_guestNameController.text);
                            });
                          }
                        },
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
                                text: guests.isEmpty
                                    ? "Save and add more"
                                    : "Add more guest",
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(width: 16.w),
                              SvgPicture.asset(
                                "assets/icons/common/add.svg",
                                height: 20.sp,
                                width: 20.sp,
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
                              label: "Go back",
                              backgroundColor: AppColors.tertiaryButtonColor,
                            ),
                          ),
                          SizedBox(width: 16.w),
                          Expanded(
                            child: CustomInnerShadowButton(
                              ontap: () {
                                if (_formKey.currentState!.validate()) {
                                  // GoRouter.of(
                                  //   context,
                                  // ).pushNamed(AppRouteNames.pinThePlace);
                                }
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
              SizedBox(height: 68.h),
            ],
          ),
        ),
      ),
    );
  }

  // void _showGuestAddingPopup(BuildContext context) {
  //   final TextEditingController _nameController = TextEditingController();
  //   final TextEditingController _linkController = TextEditingController();

  //   final GlobalKey<FormState> _popupFormKey = GlobalKey<FormState>();
  //   showDialog(
  //     context: context,
  //     barrierDismissible: true,
  //     builder: (context) {
  //       return Dialog(
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(24.r),
  //         ),
  //         backgroundColor: AppColors.modalColor,
  //         insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
  //         child:
  //       );
  //     },
  //   );
  // }
}
