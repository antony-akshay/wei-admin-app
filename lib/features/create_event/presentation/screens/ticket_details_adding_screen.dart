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

class TicketDetailsAddingScreen extends StatefulWidget {
  TicketDetailsAddingScreen({super.key, this.isAddingNextTicket = false});
  bool isAddingNextTicket;
  @override
  State<TicketDetailsAddingScreen> createState() =>
      _TicketDetailsAddingScreenState();
}

class _TicketDetailsAddingScreenState extends State<TicketDetailsAddingScreen> {
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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 24.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: CreateEventHeader(),
              ),
              SizedBox(height: 24.h),
              TopSectionCard(
                iconPath: "assets/icons/navbar/selected_ticket.svg",
                title: "Ticket details",
                description: "Add your ticket type, price and seating layout",
              ),
              if (_tickets.isNotEmpty)
                SizedBox(
                  height: 42.h,
                ), // dont have to show empty space when no list is there
              SizedBox(
                height: _tickets.isEmpty ? 0 : 58.h,
                child: ListView.builder(
                  itemCount: _tickets.length,
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
                            ).pushNamed(AppRouteNames.editTicket),
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
                                    text: _tickets[index],
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
                                _tickets.removeAt(index);
                                if (index == 0) {
                                  widget.isAddingNextTicket = false;
                                }
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

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (!widget.isAddingNextTicket)
                            BrowseFilesCard(title: "Seating layout"),
                          BrowseFilesCard(title: "Ticket image"),
                        ],
                      ),
                      SizedBox(height: 32.h),
                      GestureDetector(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              _tickets.add(
                                "${_ticketTypeNotifier.value}-\$${_ticketPriceController.text}",
                              );
                              widget.isAddingNextTicket = true;
                            });
                            _formKey.currentState?.reset();
                            _ticketTypeNotifier.value = null;
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
                                text: _tickets.isEmpty
                                    ? "Save and add more"
                                    : "Add more tickets",
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
}
