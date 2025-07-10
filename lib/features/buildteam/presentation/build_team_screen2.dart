import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wei_admin/common_widgets/custom_inner_shadow_icon_button.dart';
import 'package:wei_admin/features/buildteam/widgets/buildteam_button.dart';
import 'package:wei_admin/features/buildteam/widgets/buildteam_customtext.dart';
import 'package:wei_admin/features/buildteam/widgets/buildteam_dropdown.dart';
import 'package:wei_admin/features/buildteam/widgets/buildteam_textfield.dart';
import 'package:wei_admin/features/buildteam/widgets/cancel_button.dart';

class BuildTeamScreen2 extends StatefulWidget {
  const BuildTeamScreen2({super.key});

  @override
  State<BuildTeamScreen2> createState() => _BuildTeamScreen1State();
}

class _BuildTeamScreen1State extends State<BuildTeamScreen2> {
  TextEditingController organisationController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController contactNoController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController gstNoController = TextEditingController();
  TextEditingController panNoController = TextEditingController();
  final List<String> _organisationType = ['Private', 'Public', 'NGO'];
  final ValueNotifier<String?> dropdownValue = ValueNotifier(null);
  String gstRegistered = 'Yes';

  String? selectedType;

  final _formKey = GlobalKey<FormState>();

  String? emptyFieldValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This field cannot be empty';
    }
    return null;
  }

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
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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

                      Requiredtext(
                        text: 'Organization name',
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                      SizedBox(height: 10),
                      BuildteamTextfield(
                        controller: organisationController,
                        hintText: 'Enter your organization name',
                        validator: emptyFieldValidator,
                        formKey: _formKey,
                      ),
                      SizedBox(height: 10),
                      Requiredtext(
                        text: 'Type of organisation',
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                      SizedBox(height: 10),
                      BuildteamDropdown(
                        items: _organisationType,
                        selectedValueNotifier: dropdownValue,
                      ),
                      const SizedBox(height: 10),
                      Requiredtext(
                        text: 'Organization email ID',
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                      SizedBox(height: 10),
                      BuildteamTextfield(
                        controller: emailController,
                        hintText: 'Enter your organization email',
                        validator: emptyFieldValidator,
                        formKey: _formKey,
                      ),
                      SizedBox(height: 10),
                      Requiredtext(
                        text: 'Organization contact number',
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                      SizedBox(height: 10),
                      BuildteamTextfield(
                        controller: contactNoController,
                        hintText: 'Enter your organization contact number',
                        validator: emptyFieldValidator,
                        formKey: _formKey,
                      ),
                      SizedBox(height: 10),
                      Requiredtext(
                        text: 'Organization address',
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                      SizedBox(height: 10),
                      BuildteamTextfield(
                        controller: addressController,
                        hintText: 'Enter your organization address',
                        validator: emptyFieldValidator,
                        formKey: _formKey,
                      ),
                      SizedBox(height: 10),
                      Requiredtext(
                        text: 'Do you have GST registration',
                        fontSize: 16,
                      ),
                      SizedBox(height: 10),
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
                      SizedBox(height: 10),
                      Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Requiredtext(text: 'GST IN', fontSize: 16),
                            const SizedBox(height: 8),
                            BuildteamTextfield(
                              controller: gstNoController,
                              hintText: 'Enter your GST number',
                              validator: emptyFieldValidator,
                              formKey: _formKey,
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
                            BuildteamTextfield(
                              controller: panNoController,
                              hintText: 'Enter your pan card number here..',
                              validator: emptyFieldValidator,
                              formKey: _formKey,
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
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12.0,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Requiredtext(
                                        text: 'PAN number',
                                        fontSize: 16,
                                      ),
                                      SizedBox(height: 10),
                                      SizedBox(
                                        width: 168,
                                        height: 134,
                                        child: SvgPicture.asset(
                                          'assets/images/upload_interface.svg',
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Requiredtext(
                                        text: 'Company logo',
                                        fontSize: 16,
                                      ),
                                      SizedBox(height: 10),
                                      SizedBox(
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
                            SizedBox(height: 15),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12.0,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ConstrainedBox(
                                        constraints: BoxConstraints(
                                          maxWidth:
                                              MediaQuery.of(
                                                context,
                                              ).size.width *
                                              0.5,
                                        ),
                                        child: Requiredtext(
                                          text: 'MOA/AOA/Company certificate',
                                          softWrap: true,
                                          fontSize: 16,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      SizedBox(
                                        width: 168,
                                        height: 134,
                                        child: SvgPicture.asset(
                                          'assets/images/upload_interface.svg',
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Requiredtext(
                                        text: 'Bank cheque',
                                        fontSize: 16,
                                      ),
                                      SizedBox(height: 10),
                                      SizedBox(
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
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Image.png',
                                      style: GoogleFonts.urbanist(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Icon(
                                      Icons.close,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 40),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CancelButton(label: 'Cancel'),
                                BuildteamButton(label: 'Create'),
                              ],
                            ),
                          ],
                        ),
                      ),
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
