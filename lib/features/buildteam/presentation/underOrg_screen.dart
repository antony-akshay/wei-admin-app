import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wei_admin/features/buildteam/widgets/buildteam_button.dart';
import 'package:wei_admin/features/buildteam/widgets/buildteam_customtext.dart';
import 'package:wei_admin/features/buildteam/widgets/buildteam_dropdown.dart';
import 'package:wei_admin/features/buildteam/widgets/buildteam_textfield.dart';
import 'package:wei_admin/common_widgets/cancel_button.dart';
import 'package:wei_admin/features/buildteam/widgets/upload_section.dart';
import 'package:wei_admin/routes/app_route_constants.dart';

class CreateUnderOrganistionScreen extends StatefulWidget {
  const CreateUnderOrganistionScreen({super.key});

  @override
  State<CreateUnderOrganistionScreen> createState() =>
      _CreateUnderOrganistionScreenState();
}

class _CreateUnderOrganistionScreenState
    extends State<CreateUnderOrganistionScreen> {
  final TextEditingController organisationController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController contactNoController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController gstNoController = TextEditingController();
  final TextEditingController panNoController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final List<String> sections = [
    'PAN number',
    'Company logo',
    'MOA/AOA/Company certificate',
    'Bank cheque',
  ];

  String gstRegistered = 'No';
  List<String> _organisationType = [
    "Government (Govt)",
    "Private Limited (Pvt Ltd)",
    "Non-Profit Organization (NPO / NGO)",
    "Public Limited",
    "Trust",
    "Society",
    "Individual / Sole Proprietor",
    "Partnership Firm",
    "Educational Institution (College/University-run)",
    "Co-operative Society",
  ];
  final ValueNotifier<String?> dropdownValue = ValueNotifier<String?>(null);

  String? emptyFieldValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 20.h),
      child: Column(
        children: [
          Requiredtext(
            text: 'Organization name',
            fontWeight: FontWeight.w400,
            fontSize: 16.sp,
          ),
          SizedBox(height: 10.h),
          BuildteamTextfield(
            controller: organisationController,
            hintText: 'Enter your organization name',
            validator: emptyFieldValidator,
            formKey: _formKey,
          ),
          SizedBox(height: 10.h),
          Requiredtext(
            text: 'Type of organisation',
            fontWeight: FontWeight.w400,
            fontSize: 16.sp,
          ),
          SizedBox(height: 10.h),
          BuildteamDropdown(
            items: _organisationType,
            selectedValueNotifier: dropdownValue,
            hint: 'Select the type',
          ),
          SizedBox(height: 10.h),
          Requiredtext(
            text: 'Organization email ID',
            fontWeight: FontWeight.w400,
            fontSize: 16.sp,
          ),
          SizedBox(height: 10.h),
          BuildteamTextfield(
            controller: emailController,
            hintText: 'Enter your organization email',
            validator: emptyFieldValidator,
            formKey: _formKey,
          ),
          SizedBox(height: 10.h),
          Requiredtext(
            text: 'Organization contact number',
            fontWeight: FontWeight.w400,
            fontSize: 16.sp,
          ),
          SizedBox(height: 10.h),
          BuildteamTextfield(
            controller: contactNoController,
            hintText: 'Enter your organization contact number',
            validator: emptyFieldValidator,
            formKey: _formKey,
          ),
          SizedBox(height: 10.h),
          Requiredtext(
            text: 'Organization address',
            fontWeight: FontWeight.w400,
            fontSize: 16.sp,
          ),
          SizedBox(height: 10.h),
          BuildteamTextfield(
            controller: contactNoController,
            hintText: 'Enter your organization address',
            validator: emptyFieldValidator,
            formKey: _formKey,
          ),
          SizedBox(height: 10.h),
          Requiredtext(text: 'Do you have GST registration', fontSize: 16.sp),
          SizedBox(height: 10.h),
          Row(
            children: [
              Radio<String>(
                value: 'Yes',
                groupValue: gstRegistered,
                activeColor: Colors.white,
                onChanged: (value) {
                  setState(() {
                    gstRegistered = value!;
                  });
                },
              ),
              Text(
                'Yes',
                style: GoogleFonts.urbanist(
                  color: Colors.white,
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(width: 18.w),
              Radio<String>(
                value: 'No',
                groupValue: gstRegistered,
                activeColor: Colors.white,
                onChanged: (value) {
                  setState(() {
                    gstRegistered = value!;
                  });
                },
              ),
              Text(
                'No',
                style: GoogleFonts.urbanist(
                  color: Colors.white,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (child, animation) {
                    return FadeTransition(
                      opacity: animation,
                      child: SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(0.0, 0.1),
                          end: Offset.zero,
                        ).animate(animation),
                        child: child,
                      ),
                    );
                  },
                  child: gstRegistered == 'Yes'
                      ? Column(
                          key: const ValueKey('gst_field'),
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Requiredtext(text: 'GST IN', fontSize: 16.sp),
                            SizedBox(height: 8.h),
                            BuildteamTextfield(
                              controller: gstNoController,
                              hintText: 'Enter your GST number',
                              validator: emptyFieldValidator,
                              formKey: _formKey,
                            ),
                            SizedBox(height: 10.h),
                          ],
                        )
                      : const SizedBox.shrink(key: ValueKey('empty_gst_field')),
                ),
                Requiredtext(text: 'PAN number', fontSize: 16.sp),
                SizedBox(height: 8.h),
                BuildteamTextfield(
                  controller: panNoController,
                  hintText: 'Enter your pan card number here..',
                  validator: emptyFieldValidator,
                  formKey: _formKey,
                ),
                SizedBox(height: 10.h),
                Text(
                  'Upload documents',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  'Need to share something important? Upload your files here.',
                  style: TextStyle(fontSize: 12.sp, color: Colors.white70),
                ),
                SizedBox(height: 10.h),
                LayoutBuilder(
                  builder: (context, constraints) {
                    double maxWidth = constraints.maxWidth;
                    double itemWidth =
                        (maxWidth - 20.w) / 2; // space between two items

                    return Wrap(
                      spacing: 10.w,
                      runSpacing: 10.h,
                      children: List.generate(sections.length, (index) {
                        return SizedBox(
                          width: itemWidth,
                          child: UploadSection(
                            label: sections[index],
                            height: sections[index] == "Bank cheque"
                                ? 32.h
                                : 5.h,
                          ),
                        );
                      }),
                    );
                  },
                ),

                SizedBox(height: 20.h),
                SizedBox(height: 40.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CancelButton(label: 'Cancel'),
                    BuildteamButton(
                      label: 'Create',
                      onTap: () {
                        GoRouter.of(
                          context,
                        ).pushNamed(AppRouteNames.addmembers);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
