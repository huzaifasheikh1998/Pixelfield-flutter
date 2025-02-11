import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixelfield/core/components/app_textfield.dart';
import 'package:pixelfield/core/components/app_textstyle.dart';
import 'package:pixelfield/core/components/buttons/back_button.dart';
import 'package:pixelfield/core/components/buttons/primary_button.dart';
import 'package:pixelfield/core/components/content.dart';
import 'package:pixelfield/core/constants/app_colors.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 1.sh,
        width: 1.sw,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        color: AppColors.screenBg,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GetBackButton(),
              40.verticalSpace,
              Content(
                data: "Sign in",
                style: AppTextSyle.displayLarge.copyWith(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              32.verticalSpace,
              AppTextField(
                hint: "Enter your email",
                label: "Email",
              ),
              16.verticalSpace,
              AppTextField(
                hint: "Enter your password",
                isPassword: true,
                label: "Password",
                obscureColor: AppColors.primary,
              ),
              40.verticalSpace,
              PrimaryButton(
                title: "Continue",
                onTap: () {},
              ),
              40.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Content(
                    data: "Can’t sign in? ",
                    style: AppTextSyle.displayRegularSmall,
                  ),
                  Content(
                    data: " Recover password",
                    style: AppTextSyle.displayRegularSmall.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
