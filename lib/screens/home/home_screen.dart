import 'package:flutter/material.dart';
import 'package:wei_admin/screens/common_widgets/custom_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [CustomText(text: "Home")]);
  }
}
