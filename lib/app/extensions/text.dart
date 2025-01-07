import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      fontFamily: GoogleFonts.poppins().fontFamily,
    );
  }
}
