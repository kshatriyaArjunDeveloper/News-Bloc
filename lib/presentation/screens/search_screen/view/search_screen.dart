import 'package:flutter/material.dart';

import '../../../../theme/app_colors.dart';
import '../../../../widgets/search_text_fields/news_search_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.grey,
        body: Column(
          children: [
            SearchWidget(),
          ],
        ),
      ),
    );
  }
}
