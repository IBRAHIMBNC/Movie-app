import 'package:flutter/material.dart';

class MyContainer extends Container {
  MyContainer(
      {super.key,
      super.child,
      super.color,
      super.decoration,
      super.padding,
      super.alignment,
      super.margin,
      this.border,
      this.onTap,
      this.backgroundImage,
      this.radius = 16,
      this.height,
      this.width,
      this.shadow,
      this.gradient});
  final dynamic radius;
  final double? height;
  final double? width;
  final DecorationImage? backgroundImage;
  final Function()? onTap;
  final BoxShadow? shadow;
  final BorderSide? border;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: WidgetStateProperty.all(Colors.transparent),
      onTap: onTap,
      child: Container(
        key: key,
        height: height,
        width: width,
        // color: color,
        decoration: decoration ??
            BoxDecoration(
              color: color,
              gradient: gradient,
              boxShadow: [if (shadow != null) shadow!],
              image: backgroundImage,
              border: Border.fromBorderSide(border ?? BorderSide.none),
              borderRadius:
                  radius.runtimeType == int || radius.runtimeType == double
                      ? BorderRadius.circular(radius.toDouble())
                      : radius.runtimeType == BorderRadius
                          ? radius
                          : BorderRadius.zero,
            ),
        padding: padding ?? EdgeInsets.zero,
        alignment: alignment,
        margin: margin,
        child: child,
      ),
    );
  }
}
