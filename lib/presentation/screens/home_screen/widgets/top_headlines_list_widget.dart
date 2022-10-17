import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_bloc/business_logic/cubits/news_cubit/news_cubit.dart';
import 'package:news_bloc/business_logic/cubits/news_cubit/news_fetch_state.dart';
import 'package:news_bloc/core/utility/data/network_requester.dart';
import 'package:news_bloc/core/values/screen_navigation_constants.dart';
import 'package:news_bloc/core/values/strings.dart';
import 'package:news_bloc/data/data_source/news_api_remote_data_source.dart';
import 'package:news_bloc/domain/models/news_model.dart';
import 'package:news_bloc/presentation/screens/news_detail_screen/view/news_detail_screen.dart';
import 'package:news_bloc/presentation/theme/app_colors.dart';
import 'package:news_bloc/presentation/theme/app_text_styles.dart';

import '../../../../core/values/images.dart';

class TopHeadlinesWidget extends StatelessWidget {
  final List<NewsModel> newsList;

  const TopHeadlinesWidget({
    Key? key,
    required this.newsList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          HomeStrings.topHeadlines,
          style: AppTextStyles.tsMontSemiBoldBlack18,
        ),
        const SizedBox(
          height: 12,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: newsList.length,
            itemBuilder: (context, index) {
              var item = newsList[index];
              return _TopHeadlinesListItemWidget(item: item);
            },
          ),
        ),
      ],
    );
  }
}

class _TopHeadlinesListItemWidget extends StatelessWidget {
  const _TopHeadlinesListItemWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  final NewsModel item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Card(
        elevation: 0,
        color: AppColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: InkWell(
          onTap: () {
            NewsDetailScreen.goToNewsDetailScreen(context, item);
          },
          splashColor: AppColors.blueVeryLight,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: IntrinsicHeight(
              child: Row(
                children: [
                  _TopHeadlinesListItemNewsImageWidget(imageUrl: item.imageUrl),
                  const SizedBox(
                    width: 8,
                  ),
                  _TopHeadlinesListItemNewsTextContentWidget(item: item)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _TopHeadlinesListItemNewsImageWidget extends StatelessWidget {
  const _TopHeadlinesListItemNewsImageWidget({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: imageUrl != null
          ? FadeInImage.assetNetwork(
              placeholder: Images.newsPng,
              image: imageUrl!,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
              imageErrorBuilder: (context, exc, st) {
                return Image.asset(
                  Images.newsPng,
                  height: 100,
                  width: 100,
                );
              },
            )
          : Image.asset(
              Images.newsPng,
              height: 100,
              width: 100,
            ),
    );
  }
}

class _TopHeadlinesListItemNewsTextContentWidget extends StatelessWidget {
  const _TopHeadlinesListItemNewsTextContentWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  final NewsModel item;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.newsSource,
            style: AppTextStyles.tsPoppMedItalicBlue12,
          ),
          const SizedBox(
            height: 4,
          ),
          Expanded(
            child: Text(
              item.headline,
              style: AppTextStyles.tsPoppRegBlueDark12,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            item.time,
            style: AppTextStyles.tsMontMedGreyLight10,
          ),
        ],
      ),
    );
  }
}
