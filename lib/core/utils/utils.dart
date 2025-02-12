import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pixelfield/core/components/app_textstyle.dart';
import 'package:pixelfield/core/components/content.dart';
import 'package:pixelfield/core/constants/app_assets.dart';
import 'package:pixelfield/core/constants/app_colors.dart';

class Utils {
  static toastMessage(String message, BuildContext? context) {
    if (context != null) {
      FToast toast = FToast();
      toast.init(context);
      toast.removeCustomToast();
      toast.showToast(
        gravity: ToastGravity.TOP,
        child: Container(
          constraints: BoxConstraints(maxWidth: 1.sh * 0.8),
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          decoration: BoxDecoration(
            border: Border.all(
              width: 1.w,
              color: AppColors.black.withValues(alpha: 0.7),
            ),
            borderRadius: BorderRadius.circular(24.r),
            color: AppColors.cardBg,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                AppAssets.appLogo,
                height: 25.h,
                width: 25.w,
              ),
              10.horizontalSpace,
              Flexible(
                child: Content(
                  data: message,
                  maxLines: 2,
                  style: AppTextSyle.displayRegularSmall.copyWith(
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  static toastErrMessage(String message, BuildContext? context) {
    if (context != null) {
      FToast toast = FToast();
      toast.init(context);
      toast.removeCustomToast();
      toast.showToast(
        gravity: ToastGravity.TOP,
        child: Container(
          constraints: BoxConstraints(maxWidth: 1.sh * 0.8),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
              color: AppColors.black, borderRadius: BorderRadius.circular(24)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                AppAssets.appLogo,
                height: 25.h,
                width: 25.w,
              ),
              10.horizontalSpace,
              Flexible(
                child: Text(
                  message,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
