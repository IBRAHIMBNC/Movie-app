import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/app/constants/app_colors.dart';
import 'package:movie_app/app/constants/app_strings.dart';
import 'package:movie_app/app/constants/app_text_styles.dart';

class AppTheme {
  const AppTheme._();

  static final lightTheme = ThemeData(
    fontFamily: ksPoppinsFont,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: AppTextStyles.title.copyWith(fontWeight: FontWeight.w600),
        backgroundColor: AppColors.skyBlueColor,
        foregroundColor: AppColors.whiteColor,
        fixedSize: Size(0.65.sw, 50.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
    ),
    chipTheme: ChipThemeData(
      showCheckmark: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      labelStyle: AppTextStyles.title.copyWith(
        color: WidgetStateColor.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.whiteColor;
          } else {
            return AppColors.blackColor;
          }
        }),
        fontSize: 12.sp,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        textStyle: AppTextStyles.title.copyWith(fontWeight: FontWeight.w600),
        foregroundColor: AppColors.whiteColor,
        fixedSize: Size(0.65.sw, 55.h),
        side: BorderSide(color: AppColors.skyBlueColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
    ),
    scaffoldBackgroundColor: AppColors.backgoundColor,
    colorScheme:
        ColorScheme.fromSwatch().copyWith(surfaceTint: Colors.transparent),
  );
}
