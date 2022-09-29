import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._privateConstructor();

  static const tsMontBoldBlueDark18 = TextStyle(
    color: AppColors.blueDark,
    fontWeight: FontWeight.bold,
    fontSize: 18,
  );

  static const tsMontSemiBoldBlack18 = TextStyle(
    color: AppColors.black,
    fontWeight: FontWeight.w600,
    fontSize: 18,
  );
}