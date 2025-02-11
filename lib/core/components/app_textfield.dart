import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pixelfield/core/components/app_textstyle.dart';
import 'package:pixelfield/core/components/content.dart';
import 'package:pixelfield/core/constants/app_assets.dart';
import 'package:pixelfield/core/constants/app_colors.dart';

class AppTextField extends StatefulWidget {
  final bool? hasError, readOnly, isEnabled;
  final bool isPassword;
  final bool shadow;

  final Color? fillColor,
      fborder,
      eborder,
      bordercolor,
      textColor,
      labelTextColor,
      hintTextColor,
      obscureColor;

  final double? width;
  final double? height;
  final double? fontsize, borderRadius;

  final int? maxlines, minlines, maxCount;

  final String? label;
  final String? hint, hintLabel;

  final FocusNode? focus;
  final TextInputType? keyboard;
  final TextInputAction? textInputAction;

  final TextEditingController? controller;

  final void Function()? onTap;
  final void Function(String)? submit, onChanged;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;

  final Widget? icon, suffixIcon, prefixIcon, labelIcon;

  const AppTextField({
    super.key,
    this.inputFormatters,
    this.readOnly = false,
    this.submit,
    this.maxCount,
    this.onChanged,
    this.controller,
    this.fillColor,
    this.fontsize,
    this.hintLabel,
    this.label,
    this.labelTextColor,
    this.hintTextColor,
    this.hint,
    this.bordercolor,
    this.validator,
    this.icon,
    this.suffixIcon,
    this.width,
    this.isPassword = false,
    this.prefixIcon,
    this.labelIcon,
    this.height,
    this.hasError,
    this.maxlines,
    this.fborder,
    this.eborder,
    this.keyboard,
    this.focus,
    this.isEnabled,
    this.onTap,
    this.textInputAction,
    this.minlines,
    this.borderRadius,
    this.textColor,
    this.obscureColor,
    this.shadow = true,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool isObsure = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.label != null
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Content(
                    data: widget.label ?? "",
                    style: AppTextSyle.displaySmall.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  widget.labelIcon ?? const SizedBox()
                ],
              )
            : const SizedBox(),
        Container(
          width: widget.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 12.r),
            boxShadow: [
              widget.shadow
                  ? BoxShadow(
                      offset: Offset(0, 4.r),
                      blurRadius: 12.r,
                      color: Colors.black.withValues(alpha: .08.r),
                    )
                  : BoxShadow(
                      offset: Offset(0.r, 0),
                      blurRadius: 0,
                      color: Colors.white,
                    ),
            ],
          ),
          child: Center(
            child: TextFormField(
              maxLength: widget.maxCount,
              inputFormatters: widget.inputFormatters,
              validator: widget.validator,
              textInputAction: widget.textInputAction,
              readOnly: widget.readOnly ?? false,
              controller: widget.controller,
              onTap: widget.onTap,
              onChanged: widget.onChanged,
              onTapOutside: (_) => widget.focus?.unfocus(),
              focusNode: widget.focus,
              maxLines: widget.maxlines ?? 1,
              minLines: widget.minlines ?? 1,
              obscureText: widget.isPassword ? isObsure : false,
              cursorColor: AppColors.primary,
              keyboardType: widget.keyboard,
              style: AppTextSyle.displayRegular.copyWith(
                  color: widget.textColor ?? AppColors.white,
                  fontWeight: FontWeight.w400),
              decoration: InputDecoration(
                counterText: "",
                semanticCounterText: "",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                filled: true,
                fillColor: widget.fillColor ?? AppColors.transparent,
                prefixIcon: widget.prefixIcon,
                hintText: widget.hint,
                labelStyle: AppTextSyle.displaySmall,
                suffixIcon: widget.isPassword
                    ? GestureDetector(
                        onTap: () {
                          setState(() {
                            isObsure = !isObsure;
                          });
                        },
                        child: SvgPicture.asset(
                          isObsure ? AppAssets.hideIcon : AppAssets.visibleIcon,
                          fit: BoxFit.scaleDown,
                          colorFilter: ColorFilter.mode(
                              widget.obscureColor ?? AppColors.white,
                              BlendMode.srcIn),
                        ),
                      )
                    : widget.suffixIcon,
                hintStyle: AppTextSyle.displaySmall
                    .copyWith(color: widget.hintTextColor ?? AppColors.white),
                contentPadding: EdgeInsets.symmetric(vertical: 8.h),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primary, width: 1.w),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: widget.bordercolor ?? AppColors.primary,
                      width: 1.w),
                ),
                errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: widget.bordercolor ?? AppColors.primary,
                      width: 1.w),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: widget.bordercolor ?? AppColors.primary,
                      width: 1.w),
                ),
              ),
            ),
          ),
        ),
        if (widget.hintLabel != null)
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 10.w, top: 10.h),
                child: Text(
                  widget.hintLabel!,
                ),
              ),
            ],
          ),
      ],
    );
  }
}
