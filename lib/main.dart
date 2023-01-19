import 'package:flutter/material.dart';
import 'package:news_bloc/router/app_router.dart';
import 'package:news_bloc/theme/app_colors.dart';
import 'package:news_bloc/theme/app_fonts.dart';
import 'package:news_bloc/theme/app_styles.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BlocNews',
      theme: ThemeData(
        fontFamily: AppFonts.montserrat,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.white,
          systemOverlayStyle: AppStyles.whiteStatusBarStyle,
          elevation: 0,
        ),
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: _appRouter.onGenerateRoute,
    );
  }

  @override
  void dispose() {
    _appRouter.dispose();
    super.dispose();
  }
}
