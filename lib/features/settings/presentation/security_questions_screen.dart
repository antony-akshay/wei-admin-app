import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wei_admin/common_widgets/custom_inner_shadow_icon_button.dart';
import 'package:wei_admin/common_widgets/custom_text.dart';
import 'package:wei_admin/features/profile/widgets/color_button.dart';
import 'package:wei_admin/common_widgets/grey_button.dart';

class SecurityQuestionsScreen extends StatefulWidget {
  const SecurityQuestionsScreen({super.key});

  @override
  State<SecurityQuestionsScreen> createState() => _SecurityQuestionsScreenState();
}

class _SecurityQuestionsScreenState extends State<SecurityQuestionsScreen> {
  bool showForm = false;
  String? selectedQuestion;
  String answer = '';
  int? editingIndex; // null = new, otherwise edit existing

  List<Map<String, String>> savedQuestions = [];

  final List<String> questionOptions = [
    'Famous footballer',
    'Famous actor',
    'Favourite teacher',
  ];

  void saveQuestion() {
    if (selectedQuestion == null || answer.trim().isEmpty) return;

    if (editingIndex != null) {
      // Editing existing
      savedQuestions[editingIndex!] = {
        'question': selectedQuestion!,
        'answer': answer
      };
    } else {
      // Adding new
      savedQuestions.add({
        'question': selectedQuestion!,
        'answer': answer
      });
    }

    setState(() {
      showForm = false;
      selectedQuestion = null;
      answer = '';
      editingIndex = null;
    });
  }

  void editQuestion(int index) {
    setState(() {
      showForm = true;
      editingIndex = index;
      selectedQuestion = savedQuestions[index]['question'];
      answer = savedQuestions[index]['answer'] ?? '';
    });
  }

  void clearForm() {
    setState(() {
      selectedQuestion = null;
      answer = '';
      editingIndex = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: CustomInnerShadowIconButton(
                      iconPath: "assets/icons/common/arrow_back.svg",
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Security questions',
                          style: GoogleFonts.urbanist(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          'Choose a security question to help verify your identity if you ever lose access.',
                          style: GoogleFonts.urbanist(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(129, 129, 129, 1),
                          ),
                        ),
                        SizedBox(height: 20.h),
                      ],
                    ),
                  ),
                ],
              ),

              // Add question button
              GestureDetector(
                onTap: () {
                  setState(() {
                    showForm = true;
                    editingIndex = null;
                    selectedQuestion = null;
                    answer = '';
                  });
                },
                child: Container(
                  width: 350.w,
                  height: 47.h,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(104, 104, 104, 1),
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: 'Add security question',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                      const Icon(Icons.add, color: Colors.white),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20.h),

              // Dropdown + Answer (only if form is shown)
              if (showForm) ...[
                // Dropdown
                Container(
                  width: 350.w,
                  height: 47.h,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(56, 56, 56, 1),
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      dropdownColor: const Color.fromRGBO(56, 56, 56, 1),
                      value: selectedQuestion,
                      hint: CustomText(
                        text: 'Select a question',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                      icon: SvgPicture.asset(
                        'assets/icons/settings/drop_down.svg',
                        color: Colors.white,
                      ),
                      items: questionOptions.map((q) {
                        return DropdownMenuItem(
                          value: q,
                          child: Text(
                            q,
                            style: const TextStyle(color: Colors.white),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedQuestion = value;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(height: 10.h),

                // Answer
                Container(
                  width: 350.w,
                  height: 118.h,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(56, 56, 56, 1),
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Answer the question',
                      hintStyle: TextStyle(color: Colors.white54),
                    ),
                    onChanged: (val) => answer = val,
                    controller: TextEditingController(text: answer),
                  ),
                ),
                SizedBox(height: 10.h),

                // Buttons
                Padding(
                  padding: const EdgeInsets.only(right:  8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GreyButton(label: 'Clear', width: 100, height: 32, onTap: clearForm),
                      SizedBox(width: 10.w),
                      ColorButton(label: 'Save', width: 100, height: 32, onTap: saveQuestion),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
              ],

              // Saved Questions List
              ...savedQuestions.asMap().entries.map((entry) {
                final index = entry.key;
                final q = entry.value['question'];
                final a = entry.value['answer'];
                return GestureDetector(
                  onTap: () => editQuestion(index),
                  child: Container(
                    width: 350.w,
                    height: 47.h,
                    margin: EdgeInsets.only(bottom: 10.h),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(62, 180, 137, 1),
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: '$q ~ $a',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontColor: Colors.black,
                        ),
                        SvgPicture.asset(
                          'assets/icons/settings/rename.svg',
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
