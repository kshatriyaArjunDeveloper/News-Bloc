import 'package:news_bloc/data/data_source/news_api_remote_data_source.dart';
import 'package:news_bloc/data/dto/response_dto/top_headlines_response_dto.dart';
import 'package:news_bloc/domain/models/news_model.dart';

import '../../core/utility/data/result.dart';

class NewsRepository {
  static NewsRepository? _instance;
  late final NewsApiRemoteDataSource _newsApiRemoteDataSource;

  NewsRepository._internal(
      {required NewsApiRemoteDataSource newsApiRemoteDataSource}) {
    _newsApiRemoteDataSource = newsApiRemoteDataSource;
  }

  factory NewsRepository(
      {required NewsApiRemoteDataSource newsApiRemoteDataSource}) =>
      _instance ??= NewsRepository._internal(
          newsApiRemoteDataSource: newsApiRemoteDataSource);

  Future<Result<List<NewsModel>>> getNews() async {
    final result = await _newsApiRemoteDataSource.fetchNewsFromRemote();
    if (result.isFetchedSuccessfully()) {
      final newsList = result.data?.getNewsList();
      return Result(data: newsList);
    } else {
      return Result(error: result.error);
    }
  }
}
