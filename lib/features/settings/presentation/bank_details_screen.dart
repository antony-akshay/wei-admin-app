import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wei_admin/common_widgets/custom_inner_shadow_icon_button.dart';
import 'package:wei_admin/common_widgets/custom_text.dart';
import 'package:wei_admin/features/settings/presentation/main_settings_screen.dart';

class BankDetailsScreen extends StatelessWidget {
  const BankDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample dummy data
    final List<Map<String, String>> bankAccounts = List.generate(6, (index) {
      return {
        "type": "savings",
        "holder": "sangeethpalliyal",
        "number": "12345678915645",
        "ifsc": "UBISB0055",
      };
    });

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
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
              SizedBox(height: 20.h),
              Expanded(
                child: ListView.builder(
                  itemCount: bankAccounts.length,
                  itemBuilder: (context, index) {
                    final account = bankAccounts[index];
                    return Padding(
                      padding: EdgeInsets.only(bottom: 12.h),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 6.w,
                          vertical: 12.h,
                        ),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Bank Icon
                                CustomInnerShadowIconButton(
                                  iconPath: "assets/icons/settings/bank.svg",
                                  borderRadius: 9.6,
                                ),
                                SizedBox(width: 10.w),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AccountInfoRow(
                                        label: 'Account type :',
                                        value: account['type']!,
                                      ),
                                      AccountInfoRow(
                                        label: 'Account holder :',
                                        value: account['holder']!,
                                      ),
                                      AccountInfoRow(
                                        label: 'Account number :',
                                        value: account['number']!,
                                      ),
                                      AccountInfoRow(
                                        label: 'IFSC code :',
                                        value: account['ifsc']!,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 32.h),
                                  child: SvgPicture.asset(
                                    'assets/icons/settings/right_arrow.svg',
                                    height: 16.h,
                                    width: 16.w,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            if (index != bankAccounts.length - 1)
                              GlowingDivider(),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AccountInfoRow extends StatelessWidget {
  final String label;
  final String value;

  const AccountInfoRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 6.h),
      child: Row(
        children: [
          CustomText(
            text: label,
            fontColor: const Color.fromRGBO(129, 129, 129, 1),
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
          SizedBox(width: 6.w),
          Expanded(
            child: CustomText(
              text: value,
              fontColor: const Color.fromARGB(255, 255, 255, 255),
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
