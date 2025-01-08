import 'package:flutter/material.dart';

class AppColors {
  const AppColors._();
  static const Color primaryColor = Color(0xff2E2739);
  static const Color blackColor = Color(0xFF000000);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color greyColor = Color(0xFF827D88);
  static const Color lightGreyColor = Color(0xFFDBDBDF);
  static const Color backgoundColor = Color(0xFFF6F6FA);
  static const Color skyBlueColor = Color(0xFF61C3F2);
  static const Color errorColor = Color(0xFFF63838);
  static const Color warningColor = Color(0xFFFFCC00);
  static const Color successColor = Colors.green;
  static const Color lightGreenColor = Color(0xFF15D2BC);
  static const Color pinkColor = Color(0xFFE26CA5);
  static const Color purpleColor = Color(0xFF564CA3);
  static const Color darkYellowColor = Color(0xFFCD9D0F);
}

final blackGradient = LinearGradient(colors: [
  AppColors.blackColor.withOpacity(1),
  Colors.transparent,
  AppColors.blackColor.withOpacity(0.1)
], begin: Alignment.bottomCenter, end: Alignment.topCenter);

const List<Color> genreColors = const [
  Colors.red,
  Colors.blue,
  Colors.green,
  Colors.yellow,
  Colors.purple,
  Colors.orange,
  Colors.pink,
  Colors.teal,
  Colors.indigo,
  Colors.cyan,
  Colors.brown,
  Colors.grey,
];
