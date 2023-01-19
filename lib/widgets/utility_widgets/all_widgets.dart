import 'package:flutter/material.dart';
import 'package:hello/hello.dart';
import 'package:news_bloc/router/screen_navigation_constants.dart';
import 'package:news_bloc/theme/app_colors.dart';
import 'package:news_bloc/theme/app_text_styles.dart';
import 'package:news_bloc/widgets/search_text_fields/news_search_widget.dart';

class AllWidgets extends StatelessWidget {
  const AllWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ALL_WIDGETS_LIST = [
      const SearchWidget(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ALL WIDGETS',
          style: AppTextStyles.tsMontSemiBoldBlack18,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.popAndPushNamed(
                context,
                ScreenRoutes.homeScreen,
              );
            },
            icon: const Icon(
              Icons.arrow_forward_ios,
              color: AppColors.black,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return _DisplayWidget(
            widget: ALL_WIDGETS_LIST[index],
          );
        },
        itemCount: ALL_WIDGETS_LIST.length,
      ),
    );
  }
}

class _DisplayWidget extends StatelessWidget {
  const _DisplayWidget({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AllRoundedContainer(
          color: AppColors.black,
          width: double.infinity,
          allPadding: 12,
          child: Text(
            widget.toString(),
            style: AppTextStyles.tsMontMedWhite_14,
          ),
        ),
        PaddingCustom(
          allPadding: 16,
          child: widget,
        ),
      ],
    );
  }
}
