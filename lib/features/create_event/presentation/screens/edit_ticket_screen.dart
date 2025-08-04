import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:wei_admin/common_widgets/browse_files_card.dart';
import 'package:wei_admin/common_widgets/common_form_dropdown.dart';
import 'package:wei_admin/common_widgets/common_form_textfield.dart';
import 'package:wei_admin/common_widgets/custom_inner_shadow_button.dart';
import 'package:wei_admin/common_widgets/custom_text.dart';
import 'package:wei_admin/core/app_colors.dart';
import 'package:wei_admin/routes/app_route_constants.dart';

class EditTicketScreen extends StatefulWidget {
  EditTicketScreen({super.key});

  @override
  State<EditTicketScreen> createState() => _EditTicketScreenState();
}

class _EditTicketScreenState extends State<EditTicketScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _ticketPriceController = TextEditingController();

  final TextEditingController _seatingCapacityController =
      TextEditingController();

  final ValueNotifier<String?> _ticketTypeNotifier = ValueNotifier(null);

  final bool isAddedMultipleGuests = false;

  List<String> _tickets = [];

  List<String> _ticketTypes = ["Platinum", "Gold", "Silver", "Ordinary"];

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
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "Event category*",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(height: 14.h),
                CommonFormDropdown(
                  hint: "Select your event category",
                  items: _ticketTypes,
                  selectedValueNotifier: _ticketTypeNotifier,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Event category is required";
                    }
                  },
                ),
                SizedBox(height: 32.h),
                CustomText(
                  text: "Ticket price*",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(height: 14.h),
                CommonFormTextfield(
                  controller: _ticketPriceController,
                  hint: "Enter your event ticket price",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Ticket price is required";
                    }
                  },
                ),
                SizedBox(height: 32.h),
                CustomText(
                  text: "Capacity of seating*",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(height: 14.h),
                CommonFormTextfield(
                  controller: _seatingCapacityController,
                  hint: "Enter no of persons allowed",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Capacity of seating is required";
                    }
                  },
                ),
                SizedBox(height: 32.h),

                // BrowseFilesCard(title: "Ticket image"),
                Stack(
                  children: [
                    GestureDetector(
                      onTap: () => GoRouter.of(
                        context,
                      ).pushNamed(AppRouteNames.reuploadTicket),
                      child: ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(24.r),
                        child: Container(
                          height: 155.w,
                          width: 155.w,
                          child: Image(
                            image: NetworkImage(
                              "https://images.unsplash.com/photo-1504680177321-2e6a879aac86?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10.w,
                      right: 10.w,
                      child: CircleAvatar(
                        radius: 12.w,
                        backgroundColor: AppColors.deleteColor,
                        child: Icon(
                          Icons.close_rounded,
                          size: 16.w,
                          color: AppColors.mainFontColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 48.h),

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
                            if (_formKey.currentState!.validate()) {
                              // edit the saved details
                              GoRouter.of(context).pop();
                            }
                          }
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
