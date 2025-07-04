import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wei_admin/routes/app_route_constants.dart';
import 'package:wei_admin/screens/common_widgets/logo_widget.dart';

class SignupTypeSelectionScreen extends StatelessWidget {
  const SignupTypeSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/img/signup1_img_4.jpg',
              fit: BoxFit.cover,
            ),
          ),

          Positioned.fill(
            child: Container(color: Color.fromARGB(102, 0, 0, 0)),
          ),

          SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 48,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 18),
                      LogoWidget(),

                      const SizedBox(height: 24),

                      SizedBox(
                        height: 165,
                        width: double.infinity,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Positioned(
                              left: 30,
                              child: Transform.rotate(
                                angle: -0.2,
                                child: Container(
                                  width: 140,
                                  height: 140,
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                    borderRadius: BorderRadius.circular(23),
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 1.5,
                                    ),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadiusGeometry.circular(
                                      20,
                                    ),
                                    child: Image.asset(
                                      'assets/img/signup1_img_3.jpg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              right: 30,
                              child: Transform.rotate(
                                angle: 0.2,
                                child: Container(
                                  width: 140,
                                  height: 140,
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                    borderRadius: BorderRadius.circular(23),
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 1.5,
                                    ),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadiusGeometry.circular(
                                      20,
                                    ),
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
                                padding: const EdgeInsets.only(bottom: 14.0),
                                child: Container(
                                  width: 150,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                    borderRadius: BorderRadius.circular(23),
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 1.5,
                                    ),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadiusGeometry.circular(
                                      20,
                                    ),
                                    child: Image.asset(
                                      'assets/img/signup1_img_4.jpg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 8),

                      Text(
                        'Signup as',
                        style: GoogleFonts.urbanist(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Join as an Admin or Organization',
                        style: GoogleFonts.urbanist(
                          color: const Color.fromRGBO(192, 192, 192, 1),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),

                  Column(
                    children: [
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () {
                            GoRouter.of(
                              context,
                            ).pushNamed(AppRouteNames.adminSignup);
                          },
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: Colors.white),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(41),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 16),
                          ),
                          child: Text(
                            'Admin',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              const Color.fromRGBO(30, 18, 66, 1),
                              const Color.fromRGBO(101, 73, 184, 1),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(41),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            GoRouter.of(
                              context,
                            ).pushNamed(AppRouteNames.organizationSignup);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(41),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 16),
                          ),
                          child: Text(
                            'Send',
                            style: TextStyle(color: Colors.white, fontSize: 16),
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
