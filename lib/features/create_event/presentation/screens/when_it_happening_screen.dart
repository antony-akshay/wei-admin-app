import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:wei_admin/common_widgets/common_form_dropdown.dart';
import 'package:wei_admin/common_widgets/common_form_textfield.dart';
import 'package:wei_admin/common_widgets/custom_inner_shadow_button.dart';
import 'package:wei_admin/common_widgets/custom_inner_shadow_icon_button.dart';
import 'package:wei_admin/common_widgets/custom_text.dart';
import 'package:wei_admin/core/app_colors.dart';
import 'package:wei_admin/features/create_event/presentation/widgets/top_section_card.dart';
import 'package:wei_admin/routes/app_route_constants.dart';

class WhenItHappeningScreen extends StatefulWidget {
  WhenItHappeningScreen({super.key});

  @override
  State<WhenItHappeningScreen> createState() => _WhenItHappeningScreenState();
}

class _WhenItHappeningScreenState extends State<WhenItHappeningScreen> {
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _startTimeController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();
  final TextEditingController _endTimeController = TextEditingController();

  final List<String> _dateTypes = ["Single day", "Multi days", "Specific days"];
  List<String> dates = [];

  final _formKey = GlobalKey<FormState>();

  final ValueNotifier<String?> _dateTypeNotifier = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    children: [
                      CustomInnerShadowIconButton(
                        iconPath: "assets/icons/common/arrow_back.svg",
                      ),
                      SizedBox(width: 8.w),
                      CustomText(
                        text: "Create event",
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24.h),
                Center(
                  child: TopSectionCard(
                    iconPath: "assets/icons/event/when_it_happening.svg",
                    progress: "Step 4/6",
                    title: "When’s It Happening?",
                    description: "Pick the date and time for your event",
                  ),
                ),

                ValueListenableBuilder(
                  valueListenable: _dateTypeNotifier,
                  builder: (context, dateType, child) {
                    return dateType == "Specific days"
                        ? Padding(
                            padding: EdgeInsets.only(
                              top: dates.isNotEmpty ? 42.h : 0,
                            ),
                            child: SizedBox(
                              height: dates.isEmpty ? 0 : 58.h,
                              child: ListView.builder(
                                itemCount: dates.length,
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
                                              color:
                                                  AppColors.tertiaryButtonColor,
                                              borderRadius:
                                                  BorderRadius.circular(8.r),
                                            ),
                                            child: Center(
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 30.w,
                                                ),
                                                child: CustomText(
                                                  text: dates[index],
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
                                              dates.removeAt(index);
                                            }),
                                            child: CircleAvatar(
                                              radius: 12.h,
                                              backgroundColor:
                                                  AppColors.deleteColor,
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
                          )
                        : SizedBox.shrink();
                  },
                ),
                SizedBox(height: 32.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "Date type*",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      SizedBox(height: 14.h),
                      CommonFormDropdown(
                        hint: "Select your date type",
                        items: _dateTypes,
                        selectedValueNotifier: _dateTypeNotifier,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Date type is required";
                          }
                        },
                      ),
                      SizedBox(height: 32.h),
                      ValueListenableBuilder(
                        valueListenable: _dateTypeNotifier,
                        builder: (context, dateType, child) {
                          return CustomText(
                            text: dateType == "Specific days"
                                ? "Date*"
                                : "Start date*",
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          );
                        },
                      ),
                      SizedBox(height: 14.h),
                      CommonFormTextfield(
                        controller: _startDateController,
                        hint: "Select or enter the start date",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Start date is required";
                          }
                        },
                        suffix: Padding(
                          padding: EdgeInsets.all(13.h),
                          child: GestureDetector(
                            onTap: () async {
                              _startDateController.text = await _pickDate(
                                context,
                              );
                            },
                            child: SvgPicture.asset(
                              "assets/icons/common/calendar.svg",
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 32.h),
                      ValueListenableBuilder(
                        valueListenable: _dateTypeNotifier,
                        builder: (context, dateType, child) {
                          return CustomText(
                            text: dateType == "Specific days"
                                ? "Time*"
                                : "Start time*",
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          );
                        },
                      ),
                      SizedBox(height: 14.h),
                      CommonFormTextfield(
                        controller: _startTimeController,
                        hint: "Enter the start time",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Start ime is required";
                          }
                        },
                      ),

                      // multi days
                      // if (_dateTypeNotifier.value == "Multi days")
                      ValueListenableBuilder(
                        valueListenable: _dateTypeNotifier,
                        builder: (context, dateType, child) {
                          return _dateTypeNotifier.value == "Multi days"
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 32.h),
                                    CustomText(
                                      text: "End date*",
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    SizedBox(height: 14.h),
                                    CommonFormTextfield(
                                      controller: _endDateController,
                                      hint: "Select or enter the end date",
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "End date is required";
                                        }
                                      },
                                      suffix: Padding(
                                        padding: EdgeInsets.all(13.h),
                                        child: GestureDetector(
                                          onTap: () async {
                                            _endDateController.text =
                                                await _pickDate(context);
                                          },
                                          child: SvgPicture.asset(
                                            "assets/icons/common/calendar.svg",
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 32.h),
                                    CustomText(
                                      text: "End time*",
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    SizedBox(height: 14.h),
                                    CommonFormTextfield(
                                      controller: _endTimeController,
                                      hint: "Enter the end time",
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "End time is required";
                                        }
                                      },
                                    ),
                                  ],
                                )
                              : SizedBox.shrink();
                        },
                      ),

                      ValueListenableBuilder(
                        valueListenable: _dateTypeNotifier,
                        builder: (context, dateType, child) {
                          return dateType == "Specific days"
                              ? Padding(
                                  padding: EdgeInsets.only(top: 32.h),
                                  child: GestureDetector(
                                    onTap: () {
                                      if (_formKey.currentState!.validate()) {
                                        setState(() {
                                          dates.add(
                                            "${_startDateController.text}-${_startTimeController.text}",
                                          );
                                        });
                                      }
                                    },
                                    child: Container(
                                      height: 50.h,

                                      decoration: BoxDecoration(
                                        color: Color(0xFF606060),
                                        borderRadius: BorderRadius.circular(
                                          50.r,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CustomText(
                                            text: "Add more dates",
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
                                )
                              : SizedBox.shrink();
                        },
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
                                if (_formKey.currentState!.validate()) {
                                  GoRouter.of(
                                    context,
                                  ).pushNamed(AppRouteNames.describeYourEvent);
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
                SizedBox(height: 36.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<String> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.blue, // header background color
              onPrimary: Colors.white, // header text color
              onSurface: Colors.black, // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      final DateFormat formatter = DateFormat('dd/MM/yy');
      final String date = formatter.format(picked);
      print("Selected date: $date");
      return date;
    } else {
      return "";
    }
  }
}
