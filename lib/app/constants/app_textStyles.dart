import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/app/constants/app_colors.dart';

class AppTextStyles {
  const AppTextStyles._();

  static TextStyle title = GoogleFonts.poppins(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor,
  );

  static TextStyle descrtiption = GoogleFonts.poppins(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.primaryColor,
  );
}
