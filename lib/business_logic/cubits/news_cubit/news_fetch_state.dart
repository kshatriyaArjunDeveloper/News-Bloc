import 'package:flutter/foundation.dart';
import 'package:news_bloc/domain/models/news_model.dart';

@immutable
abstract class NewsFetchState {}

class NewsFetchLoading extends NewsFetchState {}

class NewsFetchFailure extends NewsFetchState {}

class NewsFetchedSuccess extends NewsFetchState {
  final List<NewsModel> newsModelList;

  NewsFetchedSuccess({required this.newsModelList});
}

/// @Arjun todo To be implemented
// class NoInternet extends NewsState {}
