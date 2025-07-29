import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wei_admin/common_widgets/logo_widget.dart';
import 'package:wei_admin/routes/app_route_configuration.dart';
import 'package:wei_admin/routes/app_route_constants.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/img/signup1_img_1.jpg',
              fit: BoxFit.cover,
            ),
          ),

          // Semi-transparent overlay
          Positioned.fill(
            child: Container(color: Color.fromARGB(102, 0, 0, 0)),
          ),

          // Scrollable content
          SingleChildScrollView(
            child: Container(
              height: 1.sh,
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 48.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 18.h),
                      Center(child: LogoWidget()),

                      SizedBox(height: 24.h),

                      SizedBox(
                        height: 165.h,
                        width: double.infinity,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Positioned(
                              left: 30.w,
                              child: Transform.rotate(
                                angle: -0.2,
                                child: Container(
                                  width: 140.w,
                                  height: 140.w,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(23.r),
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 1.5.w,
                                    ),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20.r),
                                    child: Image.asset(
                                      'assets/img/signup1_img_3.jpg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              right: 30.w,
                              child: Transform.rotate(
                                angle: 0.2,
                                child: Container(
                                  width: 140.w,
                                  height: 140.w,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(23.r),
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 1.5.w,
                                    ),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20.r),
                                    child: Image.asset(
                                      'assets/img/signup1_img_2.jpg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 14.h),
                                child: Container(
                                  width: 150.w,
                                  height: 150.w,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(23.r),
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 1.5.w,
                                    ),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20.r),
                                    child: Image.asset(
                                      'assets/img/signup1_img_1.jpg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 25.h),

                      Text(
                        'We is ready for hosting your',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'playwrite',
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        'extraordinary events and meetings',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'playwrite',
                        ),
                      ),
                      SizedBox(height: 15.h),
                      Text(
                        'Host your public and private events!',
                        style: GoogleFonts.urbanist(
                          color: const Color.fromARGB(255, 215, 214, 214),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),

                  Column(
                    children: [
                      SizedBox(
                        height: 50.h,
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () {
                            GoRouter.of(context).pushNamed(AppRouteNames.login);
                          },
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: Colors.white),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(41.r),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 16.h),
                          ),
                          child: Text(
                            'Signin',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Container(
                        height: 50.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color.fromRGBO(30, 18, 66, 1),
                              Color.fromRGBO(101, 73, 184, 1),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(41.r),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            GoRouter.of(
                              context,
                            ).pushNamed(AppRouteNames.signupType);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(41.r),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 16.h),
                          ),
                          child: Text(
                            'Get start',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
