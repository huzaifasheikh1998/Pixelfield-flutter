import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixelfield/core/constants/app_colors.dart';

class AppTextSyle {
// Large Text diaplay
  static TextStyle get displayLarge => TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.white,
      );

// Medium Text diaplay
  static TextStyle get displayMedium => TextStyle(
        fontSize: 22.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.white,
      );

  static TextStyle get displayMediumSmall => TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.white,
      );

// Regular Text diaplay
  static TextStyle get displayRegular => TextStyle(
        fontSize: 18.sp,
        color: AppColors.white,
      );
  static TextStyle get displayRegularSmall => TextStyle(
        fontSize: 16.sp,
        color: AppColors.white,
      );

// Small Text diaplay
  static TextStyle get displaySmall => TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.white,
      );

  static TextStyle get displaySubSmall => TextStyle(
        fontSize: 14.sp,
        color: AppColors.white,
      );
  static TextStyle get displayTiny => TextStyle(
        fontSize: 12.sp,
        color: AppColors.white,
      );
}
