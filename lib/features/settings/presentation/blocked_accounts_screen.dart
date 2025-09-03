import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wei_admin/common_widgets/custom_inner_shadow_icon_button.dart';
import 'package:wei_admin/common_widgets/custom_text.dart';
import 'package:wei_admin/common_widgets/grey_button.dart';
import 'package:wei_admin/features/settings/presentation/main_settings_screen.dart';

class BlockedAccountsScreen extends StatelessWidget {
  const BlockedAccountsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Blocked accounts',
                          style: GoogleFonts.urbanist(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          'See who you\'ve blocked and update your list anytime.',
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

              // === Blocked user list ===
              _buildBlockedTile(
                name: 'Mohanlal',
                username: '@mohanlal',
                imageUrl: 'https://i.pravatar.cc/150?img=1',
              ),
              GlowingDivider(),
              _buildBlockedTile(
                name: 'Mohanlal',
                username: '@mohanlal',
                imageUrl: 'https://i.pravatar.cc/150?img=1',
              ),
              GlowingDivider(),
              _buildBlockedTile(
                name: 'Mohanlal',
                username: '@mohanlal',
                imageUrl: 'https://i.pravatar.cc/150?img=1',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBlockedTile({
    required String name,
    required String username,
    required String imageUrl,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: CircleAvatar(
          radius: 25,
          backgroundImage: NetworkImage(imageUrl),
        ),
        title: CustomText(
          text: name,
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
        subtitle: CustomText(
          text: username,
          fontWeight: FontWeight.w400,
          fontSize: 14,
          fontColor: const Color.fromRGBO(129, 129, 129, 1),
        ),
        trailing: const GreyButton(label: 'Unblock', width: 100, height: 32),
      ),
    );
  }
}
