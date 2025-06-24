import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wei_admin/core/app_colors.dart';
import 'package:wei_admin/routes/app_route_configuration.dart';
import 'package:wei_admin/screens/authentication/signup/signup1.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, _) {
        return MaterialApp.router(
          title: 'Wei Admin',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: AppColors.mainTheme),
          ),
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouteConfiguration.router,
        );
      },              
    );
  }
}
