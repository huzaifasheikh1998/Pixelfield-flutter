import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixelfield/bloc/auth_bloc/auth_bloc.dart';
import 'package:pixelfield/bloc/auth_bloc/auth_event.dart';
import 'package:pixelfield/bloc/auth_bloc/auth_state.dart';
import 'package:pixelfield/core/components/app_textfield.dart';
import 'package:pixelfield/core/components/app_textstyle.dart';
import 'package:pixelfield/core/components/buttons/back_button.dart';
import 'package:pixelfield/core/components/buttons/primary_button.dart';
import 'package:pixelfield/core/components/content.dart';
import 'package:pixelfield/core/constants/app_colors.dart';
import 'package:pixelfield/core/utils/utils.dart';
import 'package:pixelfield/presentation/dashboard/collection_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: Scaffold(
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
                  controller: emailController,
                  hint: "Enter your email",
                  label: "Email",
                ),
                16.verticalSpace,
                AppTextField(
                  controller: passwordController,
                  hint: "Enter your password",
                  isPassword: true,
                  label: "Password",
                  obscureColor: AppColors.primary,
                ),
                40.verticalSpace,
                BlocConsumer<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state is AuthFailure) {
                      Utils.toastErrMessage(state.error, context);
                    } else if (state is AuthSuccess) {
                      Utils.toastMessage("Sign In Successful", context);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CollectionScreen(),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    return PrimaryButton(
                      loading: state is AuthLoading ? true : false,
                      title: "Continue",
                      onTap: () {
                        BlocProvider.of<AuthBloc>(context).add(
                          SignInRequested(
                            email: emailController.text,
                            password: passwordController.text,
                          ),
                        );
                      },
                    );
                  },
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
      ),
    );
  }
}
