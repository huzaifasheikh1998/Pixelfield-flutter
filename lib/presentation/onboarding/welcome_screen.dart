import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixelfield/core/components/app_textstyle.dart';
import 'package:pixelfield/core/components/content.dart';
import 'package:pixelfield/core/components/buttons/primary_button.dart';
import 'package:pixelfield/core/constants/app_assets.dart';
import 'package:pixelfield/core/constants/app_colors.dart';
import 'package:pixelfield/presentation/onboarding/sign_in_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 1.sh,
        width: 1.sw,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.screenBg),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 264.h,
              ),
              Container(
                width: 1.sw,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                color: AppColors.cardBg,
                child: Column(
                  children: [
                    Content(
                      data: "Welcome!",
                      style: AppTextSyle.displayLarge.copyWith(
                        fontSize: 32.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Content(
                      data: "Text text text!",
                      style: AppTextSyle.displayRegularSmall,
                    ),
                    24.verticalSpace,
                    PrimaryButton(
                      title: "Scan bottle",
                      onTap: () {},
                    ),
                    24.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Content(
                          data: "Have an account? ",
                          style: AppTextSyle.displayRegularSmall,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignInScreen(),
                              ),
                            );
                          },
                          child: Content(
                            data: " Sign in first",
                            style: AppTextSyle.displayRegularSmall.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
