import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixelfield/core/constants/app_colors.dart';
import 'package:pixelfield/presentation/onboarding/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: (context, child) {
        return MaterialApp(
          title: 'Pixelfield Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: "EB Garamond",
            scaffoldBackgroundColor: AppColors.transparent,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            textSelectionTheme: TextSelectionThemeData(
              selectionHandleColor: AppColors.primary,
              cursorColor: AppColors.primary,
            ),
          ),
          home: const SplashScreen(),
        );
      },
    );
  }
}
