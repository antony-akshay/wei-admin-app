import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wei_admin/core/app_colors.dart';
import 'package:wei_admin/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:wei_admin/routes/app_route_configuration.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ),
  );
  runApp(
    MultiBlocProvider(
      providers: [BlocProvider<AuthBloc>(create: (context) => AuthBloc())],
      child: const MyApp(),
    ),
  );
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
            scaffoldBackgroundColor: AppColors.backgroundColor,
          ),
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouteConfiguration.router,
        );
      },
    );
  }
}
