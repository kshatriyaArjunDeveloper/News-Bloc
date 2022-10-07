import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_bloc/business_logic/cubits/news_cubit/news_cubit.dart';
import 'package:news_bloc/core/utility/data/network_requester.dart';
import 'package:news_bloc/data/data_source/news_api_remote_data_source.dart';
import 'package:news_bloc/domain/repositories/news_repository.dart';

import '../screens/home_screen/home_screen.dart';

class AppRouter {
  /* CUBITS AND BLOCKS */
  final NewsCubit _newsCubit = NewsCubit(
      newsRepository: NewsRepository(
          newsApiRemoteDataSource:
              NewsApiRemoteDataSource(networkRequester: NetworkRequester())));

  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _newsCubit,
            child: const HomeScreen(),
          ),
        );
      default:
        return null;
    }
  }

  void dispose() {
    _newsCubit.close();
  }
}
