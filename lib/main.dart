import 'package:flutter/material.dart';
import 'package:news_bloc/presentation/router/app_router.dart';
import 'package:news_bloc/presentation/screens/home_screen/home_screen.dart';
import 'package:news_bloc/presentation/theme/app_colors.dart';
import 'package:news_bloc/presentation/theme/app_fonts.dart';
import 'package:news_bloc/presentation/theme/app_styles.dart';

void main() {
  runApp(
    MyApp(appRouter: AppRouter()),
  );
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({Key? key, required this.appRouter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: AppFonts.montserrat,
          appBarTheme: const AppBarTheme(
              backgroundColor: AppColors.white,
              systemOverlayStyle: AppStyles.whiteStatusBarStyle,
              elevation: 0)),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.onGenerateRoute,
    );
  }
}
