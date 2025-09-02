import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wei_admin/common_widgets/custom_inner_shadow_icon_button.dart';
import 'package:wei_admin/features/buildteam/presentation/underOrg_screen.dart';
import 'package:wei_admin/features/buildteam/presentation/underAdmn_screen.dart';
import 'package:wei_admin/features/buildteam/widgets/buildteam_button.dart';
import 'package:wei_admin/features/buildteam/widgets/buildteam_customtext.dart';
import 'package:wei_admin/features/buildteam/widgets/buildteam_textfield.dart';

class BuildTeamScreen1 extends StatefulWidget {
  const BuildTeamScreen1({super.key});

  @override
  State<BuildTeamScreen1> createState() => _BuildTeamScreen1State();
}

class _BuildTeamScreen1State extends State<BuildTeamScreen1> {
  String groupCreatedUnder = 'Admin';
  final _formKey = GlobalKey<FormState>();

  TextEditingController gstNoController = TextEditingController();
  TextEditingController panNoController = TextEditingController();

  String? emptyFieldValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This field cannot be empty';
    }
    return null;
  }

  final buttonStyle = BoxDecoration(
    borderRadius: BorderRadius.circular(24.r),
    gradient: const LinearGradient(
      colors: [Color.fromARGB(228, 92, 80, 254), Color(0xFF8B6EF2)],
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
    ),
  );

  final cancelButtonStyle = BoxDecoration(
    borderRadius: BorderRadius.circular(24.r),
    gradient: LinearGradient(
      colors: [
        const Color.fromARGB(255, 58, 58, 58),
        const Color.fromARGB(183, 147, 147, 147),
      ],
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(33, 36, 38, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).pop();
                      },
                      child: CustomInnerShadowIconButton(
                        iconPath: "assets/icons/common/arrow_back.svg",
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Build Your Team Space',
                          style: GoogleFonts.urbanist(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Text(
                            'Create a group, invite your crew, and make event planning a team sport.',
                            style: GoogleFonts.urbanist(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.white70,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 30.h),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Creator details',
                        style: GoogleFonts.urbanist(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        'Let the spotlight shine — add details about the brain behind the event!',
                        style: GoogleFonts.urbanist(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.white70,
                        ),
                      ),

                      SizedBox(height: 20.h),
                      Requiredtext(text: 'Group created under',fontSize: 16.h,fontWeight: FontWeight.w400,),
                      Row(
                        children: [
                          Theme(
                            data: Theme.of(context).copyWith(unselectedWidgetColor: Colors.white),
                            child: Radio(
                              value: 'Admin',
                              groupValue: groupCreatedUnder,
                              activeColor: Colors.white,
                              onChanged: (value) {
                                setState(() {
                                  groupCreatedUnder = value!;
                                  print(groupCreatedUnder);
                                }); 
                              },
                            ),
                          ),
                          Text(
                            'Admin',
                            style: GoogleFonts.urbanist(color: Colors.white),
                          ),
                          SizedBox(width: 18.w),
                          Theme(
                            data: Theme.of(context).copyWith(unselectedWidgetColor: Colors.white),
                            child: Radio(
                              value: 'Organisation',
                              groupValue: groupCreatedUnder,
                              activeColor: Colors.white,
                              onChanged: (value) {
                                setState(() {
                                  groupCreatedUnder = value!;
                                  print(groupCreatedUnder);
                                });
                              },
                            ),
                          ),
                          Text(
                            'Organisation',
                            style: GoogleFonts.urbanist(color: Colors.white),
                          ),
                        ],
                      ),

                      groupCreatedUnder == "Admin"
                          ? CreatedUnderAdminScreen()
                          : CreateUnderOrganistionScreen(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
