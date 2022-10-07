import 'package:dio/dio.dart';
import 'package:news_bloc/core/utility/data/exception_handler.dart';
import 'package:news_bloc/core/utility/data/network_requester.dart';
import 'package:news_bloc/core/values/countries_enum.dart';
import 'package:news_bloc/core/values/strings.dart';

import '../../core/utility/data/result.dart';
import '../dto/response_dto/top_headlines_response_dto.dart';

class NewsApiRemoteDataSource {
  static NewsApiRemoteDataSource? _instance;
  late final Dio _api;

  NewsApiRemoteDataSource._internal({required NetworkRequester networkRequester}) {
    _api = networkRequester.dio;
  }

  factory NewsApiRemoteDataSource({required NetworkRequester networkRequester}) =>
      _instance ??=
          NewsApiRemoteDataSource._internal(networkRequester: networkRequester);

  Future<Result<TopHeadlinesResponseDto>> fetchNewsFromRemote() async {
    try {
      final response = await _api
          .get('', queryParameters: {'country': Country.india.countryCode()});

      final topHeadlinesResponseData =
          TopHeadlinesResponseDto.fromJson(response.data);
      return Result(data: topHeadlinesResponseData);
    } on DioError catch (errorBody) {
      final String? responseError;

      final isResponseNull = errorBody.response?.data == null;
      if (isResponseNull) {
        responseError = null;
      } else {
        responseError =
            TopHeadlinesResponseDto.fromJson(errorBody.response?.data).message;
      }
      return Result<TopHeadlinesResponseDto>(
        error: ExceptionHandler.getException(errorBody, responseError),
      );
    }
  }
}
