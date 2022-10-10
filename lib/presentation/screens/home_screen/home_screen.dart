import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_bloc/business_logic/cubits/news_cubit/news_cubit.dart';
import 'package:news_bloc/business_logic/cubits/news_cubit/news_fetch_state.dart';
import 'package:news_bloc/core/utility/data/network_requester.dart';
import 'package:news_bloc/core/values/strings.dart';
import 'package:news_bloc/data/data_source/news_api_remote_data_source.dart';
import 'package:news_bloc/domain/models/news_model.dart';
import 'package:news_bloc/presentation/screens/home_screen/top_headlines_list_widget.dart';
import 'package:news_bloc/presentation/theme/app_colors.dart';
import 'package:news_bloc/presentation/theme/app_text_styles.dart';

import '../../../core/values/images.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              HomeStrings.topHeadlines,
              style: AppTextStyles.tsMontSemiBoldBlack18,
            ),
            const SizedBox(
              height: 12,
            ),
            BlocBuilder<NewsCubit, NewsFetchState>(
              builder: (context, state) {
                if (state is NewsFetchedSuccess) {
                  return TopHeadlinesListWidget(
                    newsList: state.newsModelList,
                  );
                } else if (state is NewsFetchLoading) {
                  return const Text(
                    'LOADING',
                    style: AppTextStyles.tsMontSemiBoldBlack18,
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
            )
          ],
        ),
      ),
    );
  }
}
