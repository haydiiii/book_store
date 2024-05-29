import 'package:book_store/core/utils/colors.dart';
import 'package:flutter/material.dart';

TextStyle getTitleStyle(
    {Color? color, FontWeight? fontWeight, double? fontsize}) {
  return TextStyle(
    fontSize: fontsize ?? 20,
    fontWeight: fontWeight ?? FontWeight.w500,
    color: color ?? AppColors.black,
  );
}

TextStyle getBodyStyle(
    {Color? color, FontWeight? fontWeight, double? fontsize}) {
  return TextStyle(
    fontSize: fontsize ?? 16,
    fontWeight: fontWeight ?? FontWeight.normal,
    color: color ?? AppColors.black,
  );
}

TextStyle getSmallStyle(
    {Color? color, FontWeight? fontWeight, double? fontsize}) {
  return TextStyle(
    fontSize: fontsize ?? 14,
    fontWeight: fontWeight ?? FontWeight.normal,
    color: color ?? AppColors.greyColor,
  );
}
