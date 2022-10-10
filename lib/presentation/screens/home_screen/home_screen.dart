import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:news_bloc/business_logic/cubits/news_cubit/news_cubit.dart';
import 'package:news_bloc/business_logic/cubits/news_cubit/news_fetch_state.dart';
import 'package:news_bloc/core/utility/data/network_requester.dart';
import 'package:news_bloc/core/values/animations.dart';
import 'package:news_bloc/core/values/strings.dart';
import 'package:news_bloc/data/data_source/news_api_remote_data_source.dart';
import 'package:news_bloc/domain/models/news_model.dart';
import 'package:news_bloc/presentation/screens/home_screen/top_headlines_list_widget.dart';
import 'package:news_bloc/presentation/theme/app_colors.dart';
import 'package:news_bloc/presentation/theme/app_text_styles.dart';

import '../../../core/values/images.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppStrings.appName,
          style: AppTextStyles.tsMontBoldBlueDark18,
        ),
      ),
      backgroundColor: AppColors.grey,
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<NewsCubit, NewsFetchState>(
            builder: (context, state) {
              if (state is NewsFetchedSuccess ) {
                return TopHeadlinesWidget(
                  newsList: state.newsModelList,
                );
              } else if (state is NewsFetchLoading) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Lottie.asset(
                        Animations.loading,
                      ),
                      const Text(
                        HomeStrings.fetchNews,
                        style: AppTextStyles.tsMontBoldBlueDark18,
                      )
                    ],
                  ),
                );
              } else if (state is NewsFetchFailure) {
                return const Text(
                  'FAILED',
                  style: AppTextStyles.tsMontSemiBoldBlack18,
                );
              } else {
                return const Text(
                  'SOME THING IS WRONG',
                  style: AppTextStyles.tsMontSemiBoldBlack18,
                );
              }
            },
          )),
    );
  }
}