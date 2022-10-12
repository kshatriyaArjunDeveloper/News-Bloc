import 'package:flutter/material.dart';
import 'package:news_bloc/presentation/theme/app_fonts.dart';

import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._privateConstructor();

  static const tsMontMedWhite16 = TextStyle(
    color: AppColors.white,
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );

  static const tsMontBoldBlueDark18 = TextStyle(
    color: AppColors.blueDark,
    fontWeight: FontWeight.bold,
    fontSize: 18,
  );

  static const tsMontSemiBoldWhite12 = TextStyle(
    color: AppColors.white,
    fontWeight: FontWeight.w600,
    fontSize: 12,
  );

  static const tsMontSemiBoldBlack18 = TextStyle(
    color: AppColors.black,
    fontWeight: FontWeight.w600,
    fontSize: 18,
  );

  static const tsMontMedGreyLight10 = TextStyle(
    color: AppColors.greyLight,
    fontWeight: FontWeight.w500,
    fontSize: 10,
  );

  static const tsMontMedGreyLight12 = TextStyle(
    color: AppColors.greyLight,
    fontWeight: FontWeight.w500,
    fontSize: 12,
  );

  static const tsPoppMedItalicBlue12 = TextStyle(
      color: AppColors.blue,
      fontWeight: FontWeight.w500,
      fontSize: 12,
      fontFamily: AppFonts.poppins,
      fontStyle: FontStyle.italic);

  static const tsPoppRegItalicBlue16 = TextStyle(
      color: AppColors.blue,
      fontWeight: FontWeight.normal,
      fontSize: 16,
      fontFamily: AppFonts.poppins,
      fontStyle: FontStyle.italic);

  static const tsPoppRegBlueDark16 = TextStyle(
    color: AppColors.blueDark,
    fontWeight: FontWeight.normal,
    fontSize: 16,
    fontFamily: AppFonts.poppins,
  );

  static const tsPoppRegBlueDark12 = TextStyle(
    color: AppColors.blueDark,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    fontFamily: AppFonts.poppins,
  );
}
