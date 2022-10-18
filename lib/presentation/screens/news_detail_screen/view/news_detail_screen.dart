import 'package:flutter/material.dart';
import 'package:news_bloc/domain/models/news_model.dart';
import 'package:news_bloc/presentation/theme/app_colors.dart';

import '../../../../core/values/images.dart';
import '../../../../core/values/screen_navigation_constants.dart';
import '../../../theme/app_text_styles.dart';

class NewsDetailScreen extends StatelessWidget {
  final NewsModel newsModel;

  static goToNewsDetailScreen(
      BuildContext context, NewsModel newsModelArgument) {
    Navigator.pushNamed(
      context,
      ScreenRoutes.newsDetailsScreen,
      arguments: newsModelArgument,
    );
  }

  const NewsDetailScreen({Key? key, required this.newsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _NewsHeaderWidget(newsModel: newsModel),
          Expanded(
            child: Card(
              margin: const EdgeInsets.all(12),
              elevation: 0,
              color: AppColors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      newsModel.newsSource,
                      style: AppTextStyles.tsPoppRegItalicBlue16,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      newsModel.time,
                      style: AppTextStyles.tsMontMedGreyLight12,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    if (newsModel.content != null)
                      Text(
                        newsModel.content!,
                        style: AppTextStyles.tsPoppRegBlueDark16,
                      ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _NewsHeaderWidget extends StatelessWidget {
  const _NewsHeaderWidget({
    Key? key,
    required this.newsModel,
  }) : super(key: key);

  final NewsModel newsModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Stack(
        children: [
          AspectRatio(
            aspectRatio: 4 / 3.5,
            child: newsModel.imageUrl != null
                ? FadeInImage.assetNetwork(
                    placeholder: Images.newsPng,
                    image: newsModel.imageUrl!,
                    fit: BoxFit.cover,
                    imageErrorBuilder: (context, exc, st) {
                      return Image.asset(
                        Images.newsPng,
                      );
                    },
                  )
                : Image.asset(
                    Images.newsPng,
                  ),
          ),
          Positioned(
            top: 28,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.pop(context);
              },
              splashColor: AppColors.blueVeryLight,
              mini: true,
              backgroundColor: AppColors.white54,
              child: const Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 20,
                color: AppColors.black,
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding:
                  const EdgeInsets.only(left: 12, right: 12, bottom: 8, top: 8),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    AppColors.black,
                    Colors.transparent,
                  ],
                ),
              ),
              child: Text(
                newsModel.headline,
                style: AppTextStyles.tsMontMedWhite16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
