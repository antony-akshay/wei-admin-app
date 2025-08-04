import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
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

class AddBankInfoScreen extends StatelessWidget {
  AddBankInfoScreen({super.key});
  final TextEditingController _accountHolderNameController =
      TextEditingController();
  final TextEditingController _accountNumberController =
      TextEditingController();
  final TextEditingController _ifscCodeController = TextEditingController();
  final List<String> _banks = ["SBI", "Canara", "South Indian"];
  final _formKey = GlobalKey<FormState>();
  final ValueNotifier<String?> _bankNotifier = ValueNotifier(null);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 24.h),
                  CreateEventHeader(),
                  SizedBox(height: 24.h),
                  Center(
                    child: TopSectionCard(
                      iconPath: "assets/icons/event/bank.svg",
                      title: "Add Bank Info",
                      description: "Add your account for payouts.",
                    ),
                  ),
                  SizedBox(height: 32.h),
                  CustomText(
                    text: "Bank name*",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(height: 14.h),
                  CommonFormDropdown(
                    hint: "Select your bank",
                    items: _banks,
                    selectedValueNotifier: _bankNotifier,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Bank name is required";
                      }
                    },
                  ),
                  SizedBox(height: 32.h),
                  CustomText(
                    text: "Account holder*",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(height: 14.h),
                  CommonFormTextfield(
                    controller: _accountHolderNameController,
                    hint: "Enter the account holder name",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Account holder name is required";
                      }
                    },
                  ),
                  SizedBox(height: 32.h),
                  CustomText(
                    text: "Account number*",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(height: 14.h),
                  CommonFormTextfield(
                    controller: _accountNumberController,
                    hint: "Enter the account number",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Account number is required";
                      }
                    },
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 32.h),
                  CustomText(
                    text: "IFSC code*",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(height: 14.h),
                  CommonFormTextfield(
                    controller: _ifscCodeController,
                    hint: "Enter the IFSC code",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "IFSC code is required";
                      }
                    },
                  ),
                  SizedBox(height: 32.h),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF606060),
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 13.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(text: "Change bank info", fontSize: 14.sp),
                        ],
                      ),
                    ),
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
                              ).pushNamed(AppRouteNames.guestYesOrNo);
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
        ),
      ),
    );
  }
}
