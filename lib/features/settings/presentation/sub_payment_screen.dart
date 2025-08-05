import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wei_admin/common_widgets/custom_inner_shadow_icon_button.dart';
import 'package:wei_admin/common_widgets/custom_text.dart';

class SubPaymentScreen extends StatelessWidget {
  const SubPaymentScreen({super.key});

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
                    child: CustomInnerShadowIconButton(
                      iconPath: "assets/icons/common/arrow_back.svg",
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Expanded(
                      child: Text(
                        'Choose payment option',
                        style: GoogleFonts.urbanist(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50),
              CustomActionTile(
                title: 'Debit / Credit card',
                svgAssetPath: 'assets/icons/settings/card.svg',
                onTap: () {
                  // Handle tap here
                },
              ),
              SizedBox(height: 10,),
              CustomActionTile(
                title: 'Internet banking',
                svgAssetPath: 'assets/icons/settings/bank.svg',
                onTap: () {
                  // Handle tap here
                },
              ),
              SizedBox(height: 10,),
              CustomActionTile(
                title: 'UPI payment',
                svgAssetPath: 'assets/icons/settings/upi.svg',
                onTap: () {
                  // Handle tap here
                },
              ),
              SizedBox(height: 10,),
              CustomActionTile(
                title: 'Apple pay',
                svgAssetPath: 'assets/icons/settings/apple_pay.svg',
                onTap: () {
                  // Handle tap here
                },
              ),
              SizedBox(height: 10,),
              CustomActionTile(
                title: 'PayPal',
                svgAssetPath: 'assets/icons/settings/pay_pal.svg',
                onTap: () {
                  // Handle tap here
                },
              ),
              SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomActionTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final String svgAssetPath;

  const CustomActionTile({
    Key? key,
    required this.title,
    required this.onTap,
    required this.svgAssetPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 57,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(56, 56, 56, 1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(text: title),
              SvgPicture.asset(svgAssetPath),
            ],
          ),
        ),
      ),
    );
  }
}
