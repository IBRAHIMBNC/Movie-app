import 'package:flutter/material.dart';
import 'package:movie_app/app/constants/app_strings.dart';

extension TextWeight on TextStyle {
  myCopyWith({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    double? height,
  }) {
    return TextStyle(
      fontSize: fontSize ?? this.fontSize,
      fontWeight: fontWeight ?? this.fontWeight,
      color: color ?? this.color,
      height: height ?? this.height,
      fontFamily: ksPoppinsFont,
    );
  }
}
