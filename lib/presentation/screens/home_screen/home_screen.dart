import 'package:flutter/material.dart';
import 'package:news_bloc/core/utility/data/network_requester.dart';
import 'package:news_bloc/core/values/strings.dart';
import 'package:news_bloc/data/data_source/news_api_data_source.dart';
import 'package:news_bloc/presentation/theme/app_colors.dart';
import 'package:news_bloc/presentation/theme/app_text_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dataSource = NewsApiDataSource(networkRequester: NetworkRequester());
    final headlines = dataSource.fetchNewsFromRemote();
    headlines;

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
          children: const [
            Text(
              HomeStrings.topHeadlines,
              style: AppTextStyles.tsMontSemiBoldBlack18,
            ),
          ],
        ),
      ),
    );
  }
}
