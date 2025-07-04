import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_inner_shadow/flutter_inner_shadow.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wei_admin/core/app_colors.dart';
import 'package:wei_admin/screens/navbar/navbar_control_screen.dart';

class BottomNavbarItem extends StatelessWidget {
  final int index;
  final String iconPath;

  const BottomNavbarItem({
    super.key,
    required this.index,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (index != 2) {
          selectedNavbarIndexNotifier.value = index;
        }
      },
      child: InnerShadow(
        shadows: selectedNavbarIndexNotifier.value == index
            ? [
                BoxShadow(
                  color: Colors.black.withAlpha(46),
                  offset: Offset(-6, -6),
                  blurRadius: 12,
                ),
                BoxShadow(
                  color: Colors.white.withAlpha(20),
                  offset: Offset(6, 6),
                  blurRadius: 12,
                ),
              ]
            : [],
        child: Container(
          width: 58,
          height: 58,
          decoration: BoxDecoration(
            color: index == 2 ? Color(0xFF6549B8) : AppColors.backgroundColor,
            borderRadius: BorderRadius.circular(33),
          ),
          child: Center(child: SvgPicture.asset(iconPath)),
        ),
      ),
    );
  }
}
