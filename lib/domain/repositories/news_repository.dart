import 'package:news_bloc/data/data_source/news/news_api_remote_data_source.dart';
import 'package:news_bloc/domain/models/news_model.dart';

import '../../utility/data/result.dart';

class NewsRepository {
  late final NewsApiRemoteDataSource _newsApiRemoteDataSource;

  NewsRepository({required NewsApiRemoteDataSource newsApiRemoteDataSource}) {
    _newsApiRemoteDataSource = newsApiRemoteDataSource;
  }

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
