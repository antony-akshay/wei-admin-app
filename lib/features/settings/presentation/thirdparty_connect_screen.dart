import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wei_admin/common_widgets/custom_inner_shadow_icon_button.dart';
import 'package:wei_admin/common_widgets/custom_text.dart';
import 'package:wei_admin/features/profile/widgets/color_button.dart';
import 'package:wei_admin/features/profile/widgets/grey_button.dart';
import 'package:wei_admin/features/settings/presentation/main_settings_screen.dart';

class ThirdpartyConnectScreen extends StatefulWidget {
  const ThirdpartyConnectScreen({super.key});

  @override
  State<ThirdpartyConnectScreen> createState() =>
      _ThirdpartyConnectScreenState();
}

class _ThirdpartyConnectScreenState extends State<ThirdpartyConnectScreen> {
  final List<Map<String, dynamic>> _accounts = [
    {
      'name': 'Google',
      'icon': 'assets/icons/settings/google.svg',
      'isConnected': true,
    },
    {
      'name': 'Facebook',
      'icon': 'assets/icons/settings/fb.svg',
      'isConnected': true,
    },
    {
      'name': 'Instagram',
      'icon': 'assets/icons/settings/insta.svg',
      'isConnected': true,
    },
    {
      'name': 'Apple',
      'icon': 'assets/icons/settings/apple.svg',
      'isConnected': false,
    },
    {
      'name': 'Microsoft',
      'icon': 'assets/icons/settings/microsoft.svg',
      'isConnected': false,
    },
  ];

  void toggleConnection(int index) {
    setState(() {
      _accounts[index]['isConnected'] = !_accounts[index]['isConnected'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
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
                          'Third party account linking',
                          style: GoogleFonts.urbanist(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          'Manage third-party services linked to your account for login or data sync.',
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
              SizedBox(height: 40.h),

              // Connected Section
              CustomText(
                text: 'Connected Accounts',
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 16.h),
              ..._accounts
                  .asMap()
                  .entries
                  .where((e) => e.value['isConnected'])
                  .map((entry) {
                    int index = entry.key;
                    var account = entry.value;
                    return Column(
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: SvgPicture.asset(account['icon']),
                          title: Text(
                            account['name'],
                            style: GoogleFonts.urbanist(color: Colors.white),
                          ),
                          trailing: GreyButton(
                            label: 'Disconnect',
                            width: 100.w,
                            height: 32.h,
                            onTap: () => toggleConnection(index),
                          ),
                        ),
                        GlowingDivider(),
                      ],
                    );
                  })
                  .toList(),

              SizedBox(height: 20.h),

              // Disconnected Section
              CustomText(
                text: 'Disconnected Accounts',
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 16.h),
              ..._accounts
                  .asMap()
                  .entries
                  .where((e) => !e.value['isConnected'])
                  .map((entry) {
                    int index = entry.key;
                    var account = entry.value;
                    return Column(
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: SvgPicture.asset(account['icon']),
                          title: Text(
                            account['name'],
                            style: GoogleFonts.urbanist(color: Colors.white),
                          ),
                          trailing: ColorButton(
                            label: 'Connect',
                            width: 100.w,
                            height: 32.h,
                            onTap: () => toggleConnection(index),
                          ),
                        ),
                        SizedBox(height: 8.h),
                        if (_accounts
                                .where((e) => !e['isConnected'])
                                .toList()
                                .last !=
                            account)
                          GlowingDivider(),
                      ],
                    );
                  })
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }
}
