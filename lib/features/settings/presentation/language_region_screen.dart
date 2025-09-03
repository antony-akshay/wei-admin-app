import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wei_admin/common_widgets/custom_inner_shadow_icon_button.dart';
import 'package:wei_admin/features/buildteam/widgets/buildteam_dropdown.dart';

class CountryRegion {
  final String name;
  final String timeZone;
  final String iconPath;

  CountryRegion({
    required this.name,
    required this.timeZone,
    required this.iconPath,
  });
}

class LanguageRegionScreen extends StatelessWidget {
  LanguageRegionScreen({super.key});

  final List<String> _languageType = ["English (UK)", "English (US)"];
  final List<String> _regionType = ["India (GMT +5:30)", "USA (GMT -5:00)"];

  final ValueNotifier<String?> languageDropdownValue = ValueNotifier<String?>(null);
  final ValueNotifier<String?> regionDropdownValue = ValueNotifier<String?>(null);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
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
                            'Languages and region',
                            style: GoogleFonts.urbanist(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            'Select your language and region to personalize content.',
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
                SizedBox(height: 30.h),
                Padding(
                  padding: EdgeInsets.only(left: 15.w),
                  child: Text(
                    'Preferred language',
                    style: GoogleFonts.urbanist(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(129, 129, 129, 1),
                    ),
                  ),
                ),
                SizedBox(height: 8.h),
                BuildteamDropdown(
                  items: _languageType,
                  selectedValueNotifier: languageDropdownValue,
                  hint: 'English (UK)',
                  borderColor: const Color(0xFF212426),
                ),
                SizedBox(height: 16.h),
                Divider(color: Colors.white.withOpacity(0.05), thickness: 1),
                SizedBox(height: 16.h),
                Padding(
                  padding: EdgeInsets.only(left: 15.w),
                  child: Text(
                    'Preferred region',
                    style: GoogleFonts.urbanist(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(129, 129, 129, 1),
                    ),
                  ),
                ),
                SizedBox(height: 8.h),
                BuildteamDropdown(
                  items: _regionType,
                  selectedValueNotifier: regionDropdownValue,
                  hint: 'India (GMT +5:30)',
                  borderColor: const Color(0xFF212426),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
