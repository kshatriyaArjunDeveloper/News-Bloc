import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_bloc/business_logic/cubits/internet_cubit/internet_cubit.dart';
import 'package:news_bloc/business_logic/cubits/news_cubit/news_cubit.dart';
import 'package:news_bloc/core/utility/data/network_requester.dart';
import 'package:news_bloc/core/values/screen_navigation_constants.dart';
import 'package:news_bloc/data/data_source/news_api_remote_data_source.dart';
import 'package:news_bloc/domain/models/news_model.dart';
import 'package:news_bloc/domain/repositories/news_repository.dart';
import 'package:news_bloc/presentation/screens/news_detail_screen/view/news_detail_screen.dart';

import '../screens/home_screen/view/home_screen.dart';

class AppRouter {
  /* CUBITS AND BLOCKS */
  late NewsCubit _newsCubit;
  late InternetCubit _internetCubit;

  AppRouter() {
    final networkRequester = NetworkRequester();

    // DATA SOURCES
    final newsApiRemoteDataSource =
        NewsApiRemoteDataSource(networkRequester: networkRequester);

    // REPOSITORIES
    final newsRepository =
        NewsRepository(newsApiRemoteDataSource: newsApiRemoteDataSource);

    _newsCubit = NewsCubit(newsRepository: newsRepository);
    _internetCubit = InternetCubit(connectivity: Connectivity());
  }

  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider.value(value: _internetCubit),
              BlocProvider.value(value: _newsCubit),
            ],
            child: const HomeScreen(),
          ),
        );
      case ScreenNavigation.newsDetailsScreen:
        final args = routeSettings.arguments as NewsModel;
        return MaterialPageRoute(
          builder: (_) => NewsDetailScreen(
            newsModel: args,
          ),
        );
      default:
        return null;
    }
  }

  void dispose() {
    _newsCubit.close();
    _internetCubit.close();
  }
}
