import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wei_admin/features/buildteam/widgets/buildteam_button.dart';
import 'package:wei_admin/features/buildteam/widgets/buildteam_customtext.dart';
import 'package:wei_admin/features/buildteam/widgets/buildteam_textfield.dart';
import 'package:wei_admin/features/buildteam/widgets/cancel_button.dart';
import 'package:wei_admin/features/buildteam/widgets/upload_section.dart';
import 'package:wei_admin/routes/app_route_constants.dart';

class CreatedUnderAdminScreen extends StatefulWidget {
  const CreatedUnderAdminScreen({super.key});

  @override
  State<CreatedUnderAdminScreen> createState() => _GstAndDocsSectionState();
}

class _GstAndDocsSectionState extends State<CreatedUnderAdminScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController gstNoController = TextEditingController();
  final TextEditingController panNoController = TextEditingController();

  String gstRegistered = 'No';

  String? emptyFieldValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10.h),
        Requiredtext(text: 'Do you have GST registration'),
        Row(
          children: [
            Theme(
              data: Theme.of(
                context,
              ).copyWith(unselectedWidgetColor: Colors.white),
              child: Radio<String>(
                value: 'Yes',
                groupValue: gstRegistered,
                activeColor: Colors.white,
                onChanged: (value) {
                  setState(() {
                    gstRegistered = value!;
                  });
                },
              ),
            ),
            Text(
              'Yes',
              style: GoogleFonts.urbanist(color: Colors.white, fontSize: 14.sp),
            ),
            SizedBox(width: 18.w),
            Theme(
              data: Theme.of(
                context,
              ).copyWith(unselectedWidgetColor: Colors.white),
              child: Radio<String>(
                value: 'No',
                groupValue: gstRegistered,
                activeColor: Colors.white,
                onChanged: (value) {
                  setState(() {
                    gstRegistered = value!;
                  });
                },
              ),
            ),
            Text(
              'No',
              style: GoogleFonts.urbanist(color: Colors.white, fontSize: 14.sp),
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
                          Requiredtext(text: 'GST IN'),
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
                    : SizedBox.shrink(key: const ValueKey('empty_gst_field')),
              ),
              SizedBox(height: 10.h),
              Requiredtext(text: 'PAN number'),
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
                style: GoogleFonts.urbanist(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                'Need to share something important? Upload your files here.',
                style: GoogleFonts.urbanist(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.white70,
                ),
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Expanded(child: UploadSection(label: 'PAN number')),
                    SizedBox(width: 12), // spacing between the two widgets
                    Expanded(child: UploadSection(label: 'Bank cheque')),
                  ],
                ),
              ),

              SizedBox(height: 40.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CancelButton(label: 'Cancel'),
                  BuildteamButton(
                    label: 'Create',
                    onTap: () {
                      GoRouter.of(context).pushNamed(AppRouteNames.addmembers);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
