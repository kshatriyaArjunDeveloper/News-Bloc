import 'package:flutter/foundation.dart';
import 'package:news_bloc/domain/models/news_model.dart';

@immutable
abstract class NewsFetchState {}

class NewsFetchNothing extends NewsFetchState {}

class NewsFetchLoading extends NewsFetchState {}

class NewsFetchFailure extends NewsFetchState {
  final String errorMessage;

  NewsFetchFailure({required this.errorMessage});
}

class NewsFetchedSuccess extends NewsFetchState {
  final List<NewsModel> newsModelList;

  NewsFetchedSuccess({required this.newsModelList});
}