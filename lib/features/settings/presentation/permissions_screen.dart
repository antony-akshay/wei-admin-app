import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wei_admin/common_widgets/custom_inner_shadow_icon_button.dart';
import 'package:wei_admin/common_widgets/custom_text.dart';
import 'package:wei_admin/features/buildteam/widgets/buildteam_dropdown.dart';
import 'package:wei_admin/features/settings/presentation/login_history_screen.dart';
import 'package:wei_admin/features/settings/presentation/notification_settings_screen.dart';

class PermissionsScreen extends StatefulWidget {
  PermissionsScreen({super.key});

  @override
  State<PermissionsScreen> createState() => _PermissionsScreenState();
}

class _PermissionsScreenState extends State<PermissionsScreen> {
  bool isOff = true;
  List<String> _genderType = ["male", "female"];
  bool isEditEventEnabled = true;
  bool isDeleteEventEnabled = true;
  bool isRevenuePermissionEnabled = true;
  bool isViewStatisticsEnabled = true;
  bool isInviteOthersEnabled = true;
  bool isDeleteGroupAndMembersEnabled = true;
  bool isBlockOthersEnabled = true;

  final ValueNotifier<String?> dropdownValue = ValueNotifier<String?>(null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Role and Permission settings',
                            style: GoogleFonts.urbanist(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            'Assign roles to manage events, revenue, members, and insights securely.',
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
                NotificationToggleTile(
                  textColor: Color.fromRGBO(129, 129, 129, 1),
                  fontSize: 16,
                  title: 'Off',
                  value: isOff,
                  onChanged: (value) {},
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: GlowingDivider(),
                ),

                CustomText(
                  text: 'Groups',
                  fontSize: 14, // Default to 14 if not provided
                  fontWeight: FontWeight.w600,
                  fontColor: Colors.white, // Default to white if not provided
                ),
                SizedBox(height: 10.h),
                BuildteamDropdown(
                  items: _genderType,
                  selectedValueNotifier: dropdownValue,
                  hint: 'Select a group',
                  fillColor: Color.fromRGBO(56, 56, 56, 1),
                  borderColor: Color.fromRGBO(56, 56, 56, 1),
                ),
                SizedBox(height: 10.h),
                CustomText(
                  text: 'Members',
                  fontSize: 14, // Default to 14 if not provided
                  fontWeight: FontWeight.w600,
                  fontColor: Colors.white, // Default to white if not provided
                ),
                SizedBox(height: 10.h),
                BuildteamDropdown(
                  items: _genderType,
                  selectedValueNotifier: dropdownValue,
                  hint: 'Select a member',
                  fillColor: Color.fromRGBO(56, 56, 56, 1),
                  borderColor: Color.fromRGBO(56, 56, 56, 1),
                ),
                SizedBox(height: 20.h),
                CustomText(
                  text: 'Change role',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontColor: Color.fromRGBO(129, 129, 129, 1),
                ),
                SizedBox(height: 10.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextFormField(
                        style: GoogleFonts.urbanist(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                          border: InputBorder.none,
                          hintText: 'Editor',
                          hintStyle: GoogleFonts.urbanist(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(129, 129, 129, 1),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                      height: 16,
                      child: SvgPicture.asset(
                        'assets/icons/settings/rename_white.svg',
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: GlowingDivider(),
                ),
                buildSectionTitle('Event Controls'),
                NotificationToggleTile(
                  title: 'Edit Event',
                  value: isEditEventEnabled,
                  onChanged: (value) {
                    setState(() => isEditEventEnabled = value);
                  },
                ),
                NotificationToggleTile(
                  title: 'Delete Event',
                  value: isDeleteEventEnabled,
                  onChanged: (value) {
                    setState(() => isDeleteEventEnabled = value);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: GlowingDivider(),
                ),
                buildSectionTitle('Financial Access'),
                NotificationToggleTile(
                  title: 'Revenue Permission',
                  value: isRevenuePermissionEnabled,
                  onChanged: (value) {
                    setState(() => isRevenuePermissionEnabled = value);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: GlowingDivider(),
                ),
                buildSectionTitle('Insights & Analytics'),
                NotificationToggleTile(
                  title: 'View Statistics',
                  value: isViewStatisticsEnabled,
                  onChanged: (value) {
                    setState(() => isViewStatisticsEnabled = value);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: GlowingDivider(),
                ),
                buildSectionTitle('Group Management'),
                NotificationToggleTile(
                  title: 'Invite Others',
                  value: isInviteOthersEnabled,
                  onChanged: (value) {
                    setState(() => isInviteOthersEnabled = value);
                  },
                ),
                NotificationToggleTile(
                  title: 'Delete Group and members',
                  value: isDeleteGroupAndMembersEnabled,
                  onChanged: (value) {
                    setState(() => isDeleteGroupAndMembersEnabled = value);
                  },
                ),
                NotificationToggleTile(
                  title: 'Block Others',
                  value: isBlockOthersEnabled,
                  onChanged: (value) {
                    setState(() => isBlockOthersEnabled = value);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Text(
      title,
      style: GoogleFonts.urbanist(
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        color: Colors.grey,
      ),
    );
  }
}
