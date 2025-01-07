import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension PaddingExt on double {
  EdgeInsetsGeometry get hp => EdgeInsets.symmetric(horizontal: h);

  EdgeInsetsGeometry get vp => EdgeInsets.symmetric(vertical: w);

  EdgeInsetsGeometry get top => EdgeInsets.only(top: h);

  EdgeInsetsGeometry get bottom => EdgeInsets.only(bottom: h);

  EdgeInsetsGeometry get left => EdgeInsets.only(left: w);

  EdgeInsetsGeometry get right => EdgeInsets.only(right: w);

  EdgeInsetsGeometry get all => EdgeInsets.all(h);
}
