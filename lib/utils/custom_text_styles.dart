import 'dart:ffi';
// import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sample/utils/app_colors.dart';

class CustomTextStyles {
  // Define your custom text styles as static properties
  static TextStyle headingStyle({double size = 20,Color color = AppColors.primaryColor,FontWeight  fontWeight = FontWeight.w700,}) {
    return TextStyle(
      // height: 1,
      fontSize: size,


      fontWeight: fontWeight,
      color: color,
    );
  }

  static TextStyle subHeadingStyle({
    double letterSpacing = 0,
    double height = 1.3,
    double? size = 16,
    Color? color = AppColors.greyTextColor,
    FontWeight? fontWeight = FontWeight.w400,
  }) =>
      TextStyle(
        fontSize: size,
        height:height,
        letterSpacing: letterSpacing,
        fontWeight: fontWeight,
        color: color,
      );
  static TextStyle heading({double size = 28,Color color = AppColors.primaryColor,FontWeight  fontWeight = FontWeight.w400,}) {
    return TextStyle(
      height: 1,
      fontSize: size,
      fontWeight: fontWeight,
      color: color,
    );
  }
}
