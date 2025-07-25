import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:wei_admin/common_widgets/custom_inner_shadow_icon_button.dart';
import 'package:wei_admin/common_widgets/custom_text.dart';
import 'package:wei_admin/core/app_colors.dart';
import 'package:wei_admin/features/profile/widgets/color_button.dart';
import 'package:wei_admin/features/profile/widgets/event_card.dart';
import 'package:wei_admin/features/profile/widgets/Admin_profile_card.dart';
import 'package:wei_admin/features/profile/widgets/otherUser_profile_card.dart';
import 'package:wei_admin/features/profile/widgets/profile_groups.dart';
import 'package:wei_admin/features/profile/widgets/user_card.dart';

class OthersProfileScreen extends StatefulWidget {
  const OthersProfileScreen({super.key});

  @override
  State<OthersProfileScreen> createState() => _OthersProfileScreenState();
}

class _OthersProfileScreenState extends State<OthersProfileScreen> {
  int selectedIndex = 0; // For navbar tab selection

  final List<Map<String, dynamic>> navItems = [
    {'iconPath': 'assets/icons/profile/events.svg', 'label': 'Events'},
    {'iconPath': 'assets/icons/profile/live.svg', 'label': 'Live events'},
    {'iconPath': 'assets/icons/profile/view.svg', 'label': 'Groups'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Top Bar
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 12,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 3.0),
                          child: CustomInnerShadowIconButton(
                            iconPath: "assets/icons/common/arrow_back.svg",
                          ),
                        ),
                        CustomText(
                          text: 'Profile',
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                    CustomInnerShadowIconButton(
                      iconPath: "assets/icons/common/settings.svg",
                    ),
                  ],
                ),
              ),

              // Profile Card
              OtheruserProfileCard(
                name: 'Emma radacuna',
                username: 'Emma radacuna',
                bio:
                    '🌍 Exploring the world, one flight at a time 📍Currently: [Your Current Location] 📷 Capturing moments that matter',
                events: 22,
                followers: 22,
                following: 22,
                profileImage: 'assets/img/signup1_img_1.jpg',
              ),

              SizedBox(height: 15),

              // Nav Bar
              EventNavBar(
                navItems: navItems,
                selectedIndex: selectedIndex,
                onItemSelected: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              ),

              // Content Section
              if (selectedIndex == 0 || selectedIndex == 1)
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 20.h,
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20.h,
                    crossAxisSpacing: 10.w,
                    childAspectRatio: 0.65,
                  ),
                  itemCount: 8,
                  itemBuilder: (context, index) => const EventCard(),
                )
              else if (selectedIndex == 2)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 20,
                  ),
                  child: ListView.builder(
                    itemCount: 4,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 12,
                        ),
                        child: Row(
                          children: [
                            // Avatar
                            CircleAvatar(
                              radius: 33,
                              backgroundImage: AssetImage(
                                'assets/img/signup1_img_4.jpg',
                              ),
                            ),
                            const SizedBox(width: 12),

                            // Text Info
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: 'Nothing community',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  SizedBox(height: 4),
                                  CustomText(
                                    text: '22 events created',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    fontColor: Color.fromRGBO(129, 129, 129, 1),
                                  ),
                                ],
                              ),
                            ),
                            ColorButton(
                              label: 'Request',
                              height: 32,
                              width: 100,
                            ),
                          ],
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

class EventNavBar extends StatelessWidget {
  final List<Map<String, dynamic>> navItems;
  final int selectedIndex;
  final ValueChanged<int> onItemSelected;

  const EventNavBar({
    super.key,
    required this.navItems,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(12.r),
        border: GradientBoxBorder(
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Color(0xFF343434), Color(0xFF171717)],
          ),
          width: 2.w,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(41),
            offset: const Offset(8, 8),
            blurRadius: 12.w,
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Colors.white.withAlpha(10),
            offset: const Offset(-8, -8),
            blurRadius: 12.w,
            spreadRadius: 0,
          ),
        ],
      ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(navItems.length, (index) {
            final isSelected = selectedIndex == index;
            return GestureDetector(
              onTap: () => onItemSelected(index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? Colors.white.withOpacity(0.05)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      navItems[index]['iconPath'],
                      width: 18,
                      height: 18,
                      colorFilter: const ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      navItems[index]['label'],
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
