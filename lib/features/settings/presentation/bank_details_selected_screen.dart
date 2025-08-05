import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:wei_admin/common_widgets/custom_inner_shadow_icon_button.dart';
import 'package:wei_admin/common_widgets/custom_text.dart';
import 'package:wei_admin/common_widgets/grey_button.dart';
import 'package:wei_admin/features/settings/presentation/bank_details_screen.dart';

class BankDetailsSelectedScreen extends StatelessWidget {
  const BankDetailsSelectedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Row
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
                          'Bank Account Details',
                          style: GoogleFonts.urbanist(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          'Manage your bank details to enable secure payments and receive event revenue.',
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
              SizedBox(height: 24.h),
              AccountInfoRow(label: 'Account type :', value: 'savings'),
              SizedBox(height: 5,),
              AccountInfoRow(
                label: 'Account holder :',
                value: 'sangeethpalliyal',
              ),
              SizedBox(height: 5,),
              AccountInfoRow(
                label: 'Account number :',
                value: '12345678915645',
              ),
              SizedBox(height: 5,),
              AccountInfoRow(label: 'IFSC code :', value: 'UBISB0055'),
              SizedBox(height: 15),
              Row(
                children: [
                  CustomText(
                    text: 'Total event conducted using this account :',
                    fontColor: const Color.fromRGBO(129, 129, 129, 1),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  CustomText(
                    text: '23',
                    fontColor: const Color.fromARGB(255, 255, 255, 255),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  CustomText(
                    text: 'Amount credited to this account :',
                    fontColor: const Color.fromRGBO(129, 129, 129, 1),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  CustomText(
                    text: '1000',
                    fontColor: const Color.fromARGB(255, 255, 255, 255),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
              SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GreyButton(label: 'Edit account', width: 167, height: 42),
                  Container(
                    width: 167.w,
                    height: 42.h,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 239, 117, 117), // Top
                          Color.fromARGB(255, 255, 0, 13), // Bottom
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.circular(33.r),
                      border: GradientBoxBorder(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF3E3E3E), Color(0xFF262626)],
                        ),
                        width: 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(100),
                          offset: const Offset(6, 6),
                          blurRadius: 12,
                        ),
                        BoxShadow(
                          color: Colors.white.withAlpha(20),
                          offset: const Offset(-6, -6),
                          blurRadius: 12,
                        ),
                      ],
                    ),
                    child: Center(
                      child: CustomText(
                        text: 'Delete account',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        fontColor: Colors.white,
                      ),
                    ),
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
