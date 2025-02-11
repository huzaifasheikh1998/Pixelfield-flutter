import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixelfield/core/constants/app_colors.dart';

class GetBackButton extends StatelessWidget {
  final void Function()? onTap;
  const GetBackButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ??
          () {
            Navigator.pop(context);
          },
      child: Icon(
        Icons.keyboard_backspace_rounded,
        color: AppColors.white,
        size: 30.r,
      ),
    );
  }
}
