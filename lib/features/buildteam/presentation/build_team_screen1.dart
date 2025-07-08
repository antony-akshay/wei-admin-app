import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wei_admin/common_widgets/custom_inner_shadow_icon_button.dart';

class BuildTeamScreen1 extends StatefulWidget {
  const BuildTeamScreen1({super.key});

  @override
  State<BuildTeamScreen1> createState() => _BuildTeamScreen1State();
}

class _BuildTeamScreen1State extends State<BuildTeamScreen1> {
  String groupCreatedUnder = 'Admin';
  String gstRegistered = 'Yes';

  final buttonStyle = BoxDecoration(
    borderRadius: BorderRadius.circular(24),
    gradient: const LinearGradient(
      colors: [Color.fromARGB(228, 92, 80, 254), Color(0xFF8B6EF2)],
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
    ),
  );

  final cancelButtonStyle = BoxDecoration(
    borderRadius: BorderRadius.circular(24),
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
      backgroundColor: Color.fromRGBO(33, 36, 38, 1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back Button and Heading
              Row(
                children: [
                  CustomInnerShadowIconButton(
                    iconPath: "assets/icons/common/arrow_back.svg",
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Build Your Team Space',
                        style: GoogleFonts.urbanist(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Text(
                          'Create a group, invite your crew, and make event planning a team sport.',
                          style: GoogleFonts.urbanist(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // Creator details
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Creator details',
                      style: GoogleFonts.urbanist(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Let the spotlight shine — add details about the brain behind the event!',
                      style: GoogleFonts.urbanist(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.white70,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Group Created Under
                    Row(
                      children: [
                        Text(
                          'Group created under',
                          style: GoogleFonts.urbanist(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          ' *',
                          style: GoogleFonts.urbanist(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromARGB(255, 255, 0, 0),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Theme(
                          data: Theme.of(
                            context,
                          ).copyWith(unselectedWidgetColor: Colors.white),
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
                        SizedBox(width: 18),
                        Theme(
                          data: Theme.of(
                            context,
                          ).copyWith(unselectedWidgetColor: Colors.white),
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

                    const SizedBox(height: 10),

                    // GST registration
                    Row(
                      children: [
                        Text(
                          'Do you have GST registration',
                          style: GoogleFonts.urbanist(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          ' *',
                          style: GoogleFonts.urbanist(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromARGB(255, 255, 0, 0),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Theme(
                          data: Theme.of(context).copyWith(
                            unselectedWidgetColor:
                                Colors.white, // for unselected radio
                          ),
                          child: Radio(
                            value: 'Yes',
                            groupValue: gstRegistered,
                            activeColor: Colors.white, // for selected radio
                            onChanged: (value) {
                              setState(() {
                                gstRegistered = value!;
                                print(gstRegistered);
                              });
                            },
                          ),
                        ),
                        Text(
                          'Yes',
                          style: GoogleFonts.urbanist(color: Colors.white),
                        ),
                        SizedBox(width: 18),
                        Theme(
                          data: Theme.of(
                            context,
                          ).copyWith(unselectedWidgetColor: Colors.white),
                          child: Radio(
                            value: 'No',
                            groupValue: gstRegistered,
                            activeColor: Colors.white,
                            onChanged: (value) {
                              setState(() {
                                gstRegistered = value!;
                                print(gstRegistered);
                              });
                            },
                          ),
                        ),
                        Text(
                          'No',
                          style: GoogleFonts.urbanist(color: Colors.white),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    // GST IN
                    Row(
                      children: [
                        Text(
                          'GST IN',
                          style: GoogleFonts.urbanist(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          ' *',
                          style: GoogleFonts.urbanist(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromARGB(255, 255, 0, 0),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(33, 36, 38, 1),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.white, width: 0.5),
                      ),
                      child: TextFormField(
                        style: GoogleFonts.urbanist(color: Colors.white),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter your GST number',
                          hintStyle: GoogleFonts.urbanist(
                            fontSize: 14,
                            fontWeight: FontWeight.w200,
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          'PAN number',
                          style: GoogleFonts.urbanist(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          ' *',
                          style: GoogleFonts.urbanist(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromARGB(255, 255, 0, 0),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(33, 36, 38, 1),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.white, width: 0.5),
                      ),
                      child: TextFormField(
                        style: GoogleFonts.urbanist(color: Colors.white),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter your pan card number here..',
                          hintStyle: GoogleFonts.urbanist(
                            fontSize: 14,
                            fontWeight: FontWeight.w200,
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Upload documents',
                      style: GoogleFonts.urbanist(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Need to share something important? Upload your files here.',
                      style: GoogleFonts.urbanist(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.white70,
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'PAN number',
                                    style: GoogleFonts.urbanist(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    ' *',
                                    style: GoogleFonts.urbanist(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: const Color.fromARGB(
                                        255,
                                        255,
                                        0,
                                        0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Container(
                                width: 168,
                                height: 134,
                                child: SvgPicture.asset(
                                  'assets/images/upload_interface.svg',
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Bank cheque',
                                    style: GoogleFonts.urbanist(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    ' *',
                                    style: GoogleFonts.urbanist(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: const Color.fromARGB(
                                        255,
                                        255,
                                        0,
                                        0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Container(
                                width: 168,
                                height: 134,
                                child: SvgPicture.asset(
                                  'assets/images/upload_interface.svg',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 42,
                      width: 168,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(56, 56, 56, 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Image.png',
                              style: GoogleFonts.urbanist(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                            Icon(Icons.close, color: Colors.white, size: 16),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 168,
                          height: 42,
                          decoration: cancelButtonStyle,
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Cancel",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 168,
                          height: 42,
                          decoration: buttonStyle,
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Create",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
