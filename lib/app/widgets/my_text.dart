import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/app/constants/app_colors.dart';
import 'package:movie_app/app/constants/app_textStyles.dart';

class MyText extends StatelessWidget {
  final Color? color;
  final String text;
  final double height;
  final int size;
  final FontWeight fontWeight;
  final TextAlign? textAlign;
  final TextOverflow overflow;
  final TextStyle? style;
  final int? maxLines;
  final TextDecoration? decoration;
  final bool autoSized;
  final double? minSize;
  final double? maxSize;

  const MyText(
    this.text, {
    super.key,
    this.color,
    this.size = 12,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.start,
    this.height = 1.4,
    this.overflow = TextOverflow.visible,
    this.style,
    this.maxLines,
    this.decoration,
    this.autoSized = false,
    this.minSize,
    this.maxSize,
  });

  factory MyText.title(String text,
      {Color? color, double? fontSize, TextAlign? textAlign}) {
    return MyText(
      text,
      style: AppTextStyles.title.copyWith(
        color: color,
        fontSize: fontSize?.sp,
      ),
      textAlign: textAlign,
    );
  }

  factory MyText.description(
    String text, {
    Color? color,
    double? fontSize,
    TextAlign? textAlign,
    FontWeight? fontWeight,
  }) {
    return MyText(
      text,
      style: AppTextStyles.descrtiption.copyWith(
        color: color,
        fontSize: fontSize?.sp,
        fontWeight: fontWeight,
      ),
      textAlign: textAlign,
    );
  }

  @override
  Widget build(BuildContext context) {
    const defaultColor = AppColors.primaryColor;

    if (autoSized) {
      return AutoSizeText(
        text,
        overflow: overflow,
        textAlign: textAlign,
        maxLines: maxLines,
        softWrap: true,
        minFontSize: minSize ?? style?.fontSize!.round().toDouble() ?? 4,
        maxFontSize: maxSize ?? double.infinity,
        style: style ??
            GoogleFonts.poppins(
              color: color ?? defaultColor,
              fontSize: size.sp,
              fontWeight: fontWeight,
              height: height,
              decoration: decoration,
            ),
      );
    } else {
      return Text(
        text,
        textAlign: textAlign,
        softWrap: true,
        style: style ??
            GoogleFonts.poppins(
              color: color ?? defaultColor,
              fontSize: size.sp,
              fontWeight: fontWeight,
              height: height,
              decoration: decoration,
            ),
      );
    }
  }
}
