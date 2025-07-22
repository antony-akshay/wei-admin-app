import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wei_admin/common_widgets/custom_inner_shadow_icon_button.dart';
import 'package:wei_admin/common_widgets/custom_text.dart';
import 'package:wei_admin/features/home/presentation/widgets/carousel_tile.dart';
import 'package:wei_admin/features/profile/widgets/event_card.dart';
import 'package:wei_admin/features/profile/widgets/profile_card.dart';
import 'package:wei_admin/features/profile/widgets/profile_groups.dart';
import 'package:wei_admin/features/profile/widgets/user_card.dart';

class AdminProfileScreen extends StatelessWidget {
  const AdminProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
              ProfileCardTile(
                name: 'Emma radacuna',
                username: 'Emma radacuna',
                bio:
                    '🌍 Exploring the world, one flight at a time 📍Currently: [Your Current Location] 📷 Capturing moments that matter',
                events: 22,
                followers: 22,
                following: 22,
                profileImage: 'assets/img/signup1_img_1.jpg',
              ),
              SizedBox(height: 10),
              ProfileGroups(
                groups: [
                  GroupItem(
                    image: 'assets/img/signup1_img_1.jpg',
                    name: 'Lucifer mass',
                  ),
                  GroupItem(
                    image: 'assets/img/signup1_img_2.jpg',
                    name: 'Lucifer mass',
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomText(
                    text: 'Suggestions',
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                  Container(
                    width: 75,
                    height: 32,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        50,
                      ), // High border radius for pill shape
                      border: Border.all(color: Colors.purple, width: 0.9),
                    ),
                    child: Center(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(50),
                          child: Padding(
                            padding: EdgeInsetsGeometry.all(8),
                            child: CustomText(
                              text: 'See all',
                                fontColor: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  UserCard(
                    image: 'assets/img/signup1_img_2.jpg',
                    name: 'Tesla',
                    role: 'Organisation',
                    isVerified: true,
                    followers: 666,
                    projects: 12,
                    onFollow: () => print("Followed"),
                  ),
                  UserCard(
                    image: 'assets/img/signup1_img_2.jpg',
                    name: 'Tesla',
                    role: 'Admin',
                    isVerified: false,
                    followers: 666,
                    projects: 12,
                    onFollow: () => print("Followed"),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              EventNavBar(),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20.h,
                  crossAxisSpacing: 10.w,
                  childAspectRatio:
                      0.65, // 👈 Lowered the ratio (was probably too high before)
                ),
                itemCount: 8,
                itemBuilder: (context, index) => const EventCard(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EventNavBar extends StatefulWidget {
  @override
  _EventNavBarState createState() => _EventNavBarState();
}

class _EventNavBarState extends State<EventNavBar> {
  int selectedIndex = 0;

  final List<Map<String, dynamic>> navItems = [
    {'iconPath': 'assets/icons/profile/events.svg', 'label': 'My events'},
    {'iconPath': 'assets/icons/profile/live.svg', 'label': 'Live events'},
    {'iconPath': 'assets/icons/profile/view.svg', 'label': 'View'},
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFF2A2A2A)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(navItems.length, (index) {
            final isSelected = selectedIndex == index;
            return GestureDetector(
              onTap: () => setState(() => selectedIndex = index),
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
