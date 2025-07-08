import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_inner_shadow/flutter_inner_shadow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:wei_admin/core/app_colors.dart';
import 'package:wei_admin/features/navbar/presentation/screens/navbar_control_screen.dart';
import 'package:wei_admin/features/navbar/presentation/widgets/bottom_navbar_item.dart';

class CustomBottomNavbar extends StatelessWidget {
  const CustomBottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 77.h,
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        border: GradientBoxBorder(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF171717), Color(0xFF343434)],
          ),
          width: 3.w,
        ),
        borderRadius: BorderRadius.circular(70.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(41),
            offset: Offset(4, 4),
            blurRadius: 12,
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Colors.white.withAlpha(10),
            offset: Offset(-4, -4),
            blurRadius: 12,
            spreadRadius: 0,
          ),
        ],
      ),
      child: ValueListenableBuilder(
        valueListenable: selectedNavbarIndexNotifier,
        builder: (context, selectedIndex, _) {
          log("Selected index : $selectedIndex");
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BottomNavbarItem(
                index: 0,
                iconPath: selectedIndex == 0
                    ? "assets/icons/navbar/selected_home.svg"
                    : "assets/icons/navbar/unselected_home.svg",
              ),
              BottomNavbarItem(
                index: 1,
                iconPath: selectedIndex == 1
                    ? "assets/icons/navbar/selected_ticket.svg"
                    : "assets/icons/navbar/unselected_ticket.svg",
              ),
              BottomNavbarItem(
                index: 2,
                iconPath: "assets/icons/navbar/add.svg",
              ),
              BottomNavbarItem(
                index: 3,
                iconPath: selectedIndex == 3
                    ? "assets/icons/navbar/selected_live_events.svg"
                    : "assets/icons/navbar/unselected_live_events.svg",
              ),
              BottomNavbarItem(
                index: 4,
                iconPath: "assets/icons/navbar/unselected_chatbot.svg",
              ),
            ],
          );
        },
      ),
    );
  }
}
