import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Content extends StatelessWidget {
  final String data;
  final double? size;
  final Color? color, decorationColor;
  final int? maxLines;
  final FontWeight? weight;
  final TextAlign? alignment;
  final TextDecoration? decoration;
  final TextStyle? style;

  const Content(
      {super.key,
      required this.data,
      this.size,
      this.color,
      this.decorationColor,
      this.maxLines,
      this.decoration,
      this.weight,
      this.alignment,
      this.style});

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: alignment,
      maxLines: maxLines ?? 100,
      style: style ??
          TextStyle(
              decoration: decoration,
              decorationColor: decorationColor,
              fontSize: size ?? 16.sp,
              color: color,
              fontWeight: weight,
              overflow: TextOverflow.ellipsis),
    );
  }
}
