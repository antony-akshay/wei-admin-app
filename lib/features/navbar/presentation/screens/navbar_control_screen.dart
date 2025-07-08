import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wei_admin/features/chat/presentation/screens/messages_screen.dart';
import 'package:wei_admin/features/home/presentation/screens/home_screen.dart';
import 'package:wei_admin/features/navbar/presentation/widgets/custom_bottom_navbar.dart';

ValueNotifier selectedNavbarIndexNotifier = ValueNotifier(0);

class NavbarControlScreen extends StatelessWidget {
  const NavbarControlScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 24.h),
          child: ValueListenableBuilder(
            valueListenable: selectedNavbarIndexNotifier,
            builder: (context, index, _) {
              return index == 4 ? MessagesScreen() : HomeScreen();
            },
          ),
        ),
      ),

      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 23.h),
        child: CustomBottomNavbar(),
      ),
    );
  }
}
