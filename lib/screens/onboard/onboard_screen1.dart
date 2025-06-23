import 'package:flutter/material.dart';
import 'package:wei_admin/screens/common_widgets/custom_text.dart';

class OnboardScreen1 extends StatelessWidget {
  const OnboardScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CustomText(text: "Welcome", fontSize: 20)),
    );
  }
}
