import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_bloc/data/data_source/news/news_api_remote_data_source.dart';
import 'package:news_bloc/domain/models/news_model.dart';
import 'package:news_bloc/domain/repositories/news_repository.dart';
import 'package:news_bloc/presentation/screens/dashboard/cubit/dashboard_cubit.dart';
import 'package:news_bloc/presentation/screens/dashboard/view/dashboard_screen.dart';
import 'package:news_bloc/presentation/screens/news_detail_screen/view/news_detail_screen.dart';
import 'package:news_bloc/widgets/utility_widgets/all_widgets.dart';

import '../../utility/data/network_requester.dart';
import '../presentation/common_cubits/internet_cubit/internet_cubit.dart';
import '../presentation/screens/news_feed_screen/cubit/news_feed_cubit.dart';
import 'screen_navigation_constants.dart';

class AppRouter {
  // CUBITS AND BLOCKS
  late DashboardCubit _bnbCubit;
  late NewsCubit _newsCubit;
  late InternetCubit _internetCubit;

  AppRouter() {
    // VARIABLES
    final Connectivity _connectivity = Connectivity();
    final _dio = NetworkRequester().dio;

    // DATA SOURCES
    final newsApiRemoteDataSource = NewsApiRemoteDataSource(dio: _dio);

    // REPOSITORIES
    final newsRepository =
        NewsRepository(newsApiRemoteDataSource: newsApiRemoteDataSource);

    // CUBITS AND BLOCKS
    _newsCubit = NewsCubit(newsRepository: newsRepository);
    _internetCubit = InternetCubit(connectivity: _connectivity);
    _bnbCubit = DashboardCubit();
  }

  Route? onGenerateRoute(RouteSettings routeSettings) {
    const shouldShowAllWidgets = true;

    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => shouldShowAllWidgets
              ? MultiBlocProvider(
                  providers: [
                    BlocProvider.value(value: _bnbCubit),
                    BlocProvider.value(value: _internetCubit),
                    BlocProvider.value(value: _newsCubit),
                  ],
                  child: const DashboardScreen(),
                )
              : const AllWidgets(),
        );
      case ScreenRoutes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider.value(value: _bnbCubit),
              BlocProvider.value(value: _internetCubit),
              BlocProvider.value(value: _newsCubit),
            ],
            child: const DashboardScreen(),
          ),
        );
      case ScreenRoutes.newsDetailsScreen:
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
