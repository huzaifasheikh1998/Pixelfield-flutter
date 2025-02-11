import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pixelfield/core/components/app_textstyle.dart';
import 'package:pixelfield/core/constants/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  final bool loading;
  final bool isSVG;
  final bool shadow;
  final double? borderRadius;
  final double? borderWidth;
  final double? svgImgHeight;
  final String title;
  final String? icons;
  final VoidCallback onTap;
  final double width, height;
  final Color? outlineColor;
  final Color fillColor;
  final Color textColor, loadingColor;
  final double? fontSize;
  const PrimaryButton({
    super.key,
    this.fontSize,
    required this.title,
    this.icons,
    required this.onTap,
    this.loading = false,
    this.width = 380,
    this.height = 56,
    this.outlineColor,
    this.fillColor = AppColors.primary,
    this.textColor = AppColors.black,
    this.loadingColor = AppColors.white,
    this.isSVG = false,
    this.borderRadius,
    this.borderWidth,
    this.shadow = false,
    this.svgImgHeight,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: loading ? () {} : onTap,
      child: Container(
        width: 1.sw,
        height: height.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
          border: outlineColor != null
              ? Border.all(width: borderWidth ?? 1.w, color: outlineColor!)
              : null,
          color: fillColor,
          boxShadow: [
            shadow
                ? BoxShadow(
                    color: const Color(0xffDCDCDE).withValues(alpha: .3.r),
                    blurRadius: 12.r,
                    offset: Offset(0, 4.r),
                  )
                : const BoxShadow(
                    color: Color.fromARGB(60, 255, 255, 255),
                    blurRadius: 0,
                    offset: Offset(0, 0),
                  ),
          ],
        ),
        child: loading
            ? Center(
                child: CircularProgressIndicator(
                color: loadingColor,
              ))
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icons != null
                      ? Padding(
                          padding: EdgeInsets.only(right: 15.w),
                          child: isSVG == true
                              ? SvgPicture.asset(
                                  icons!,
                                  fit: BoxFit.scaleDown,
                                  height: svgImgHeight ?? 15.h,
                                )
                              : Image.asset(
                                  icons!,
                                  scale: 3,
                                  color: textColor,
                                ),
                        )
                      : const SizedBox(),
                  Center(
                    child: Text(
                      title,
                      style: AppTextSyle.displayRegularSmall.copyWith(
                        fontSize: fontSize,
                        color: textColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
