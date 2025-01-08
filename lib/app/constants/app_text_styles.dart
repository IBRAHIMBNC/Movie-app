import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/app/constants/app_colors.dart';
import 'package:movie_app/app/constants/app_strings.dart';

class AppTextStyles {
  const AppTextStyles._();

  static TextStyle title = TextStyle(
    fontFamily: ksPoppinsFont,
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor,
  );

  static TextStyle descrtiption = TextStyle(
    fontFamily: ksPoppinsFont,
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.primaryColor,
  );
}
