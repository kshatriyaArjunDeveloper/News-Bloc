import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';

class AppStyles {
  AppStyles._privateConstructor();

  // To make status bar color white and status bar icons color dark
  static const whiteStatusBarStyle = SystemUiOverlayStyle(
    // Status bar color
    statusBarIconBrightness: Brightness.dark,
    // For Android (dark icons)
    statusBarBrightness: Brightness.light,
    // For iOS (dark icons)
    statusBarColor: AppColors.white54,
  );
}
