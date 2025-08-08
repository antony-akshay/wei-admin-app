import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:intl/intl.dart';
import 'package:wei_admin/common_widgets/custom_inner_shadow_icon_button.dart';
import 'package:wei_admin/common_widgets/custom_text.dart';
import 'package:wei_admin/common_widgets/grey_button.dart';

class TemporaryDeleteScreen extends StatelessWidget {
  const TemporaryDeleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const CustomInnerShadowIconButton(
                      iconPath: "assets/icons/common/arrow_back.svg",
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Temporary Deletion',
                          style: GoogleFonts.urbanist(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          'Hide your profile and mute notifications temporarily. Your account will reactivate automatically.',
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
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 350,
                    height: 81,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(
                        color: const Color.fromRGBO(238, 210, 2, 1),
                        width: 1.w,
                      ),
                      color: const Color.fromRGBO(238, 210, 2, 0.1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: ' Note :',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(height: 5),
                          CustomText(
                            text:
                                'We’ll keep your data safe while your profile is hidden. Just log in to return.',
                            fontColor: const Color.fromRGBO(180, 180, 180, 1),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25),
              CustomDatePickerField(
                placeholder: 'Start date',
                onDateSelected: (value) {
                  print(value);
                },
              ),
              SizedBox(height: 10),
              CustomDatePickerField(
                placeholder: 'End date',
                onDateSelected: (value) {
                  print(value);
                },
              ),
              SizedBox(height: 25),
              Container(
                width: 350,
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(
                    color: const Color.fromRGBO(238, 210, 2, 1),
                    width: 1.w,
                  ),
                  color: const Color.fromRGBO(238, 210, 2, 0.1),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset('assets/icons/settings/about.svg'),
                      SizedBox(height: 5),
                      CustomText(
                        text: '128 Days of temporary account deletion',
                        fontColor: const Color.fromRGBO(180, 180, 180, 1),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),

              Padding(
                padding: EdgeInsets.fromLTRB(16, 0, 0, 26),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GreyButton(label: 'Back', width: 167.w, height: 42),
                    SizedBox(width: 2),
                    Container(
                      width: 167.w,
                      height: 42.h,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromARGB(255, 239, 117, 117),
                            Color.fromARGB(255, 255, 0, 13),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: BorderRadius.circular(33.r),
                        border: GradientBoxBorder(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF3E3E3E), Color(0xFF262626)],
                          ),
                          width: 1.w,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withAlpha(100),
                            offset: Offset(6.w, 6.h),
                            blurRadius: 12.r,
                          ),
                          BoxShadow(
                            color: Colors.white.withAlpha(20),
                            offset: Offset(-6.w, -6.h),
                            blurRadius: 12.r,
                          ),
                        ],
                      ),
                      child: Center(
                        child: CustomText(
                          text: 'Schedule suspension',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          fontColor: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomDatePickerField extends StatefulWidget {
  final String placeholder;
  final Function(DateTime) onDateSelected;
  final DateTime? initialDate;

  const CustomDatePickerField({
    super.key,
    required this.placeholder,
    required this.onDateSelected,
    this.initialDate,
  });

  @override
  State<CustomDatePickerField> createState() => _CustomDatePickerFieldState();
}

class _CustomDatePickerFieldState extends State<CustomDatePickerField> {
  DateTime? selectedDate;

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? widget.initialDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
      widget.onDateSelected(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickDate,
      child: Container(
        width: 350,
        height: 47,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: const Color(0xFF2E2E2E),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              selectedDate != null
                  ? DateFormat('dd/MM/yyyy').format(selectedDate!)
                  : widget.placeholder,
              style: TextStyle(
                color: selectedDate != null
                    ? Colors.white
                    : Colors.grey.shade500,
                fontSize: 14,
              ),
            ),
            SvgPicture.asset('assets/icons/settings/calendar.svg'),
          ],
        ),
      ),
    );
  }
}
