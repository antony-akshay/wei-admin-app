import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wei_admin/screens/home/home_screen.dart';
import 'package:wei_admin/screens/navbar/widgets/custom_bottom_navbar.dart';

class NavbarControlScreen extends StatelessWidget {
  const NavbarControlScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeScreen(),
      
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 23.h),
        child: CustomBottomNavbar(),
      ),
    );
  }
}
