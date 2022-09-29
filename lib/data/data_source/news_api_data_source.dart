import 'package:dio/dio.dart';
import 'package:news_bloc/core/utility/data/network_requester.dart';
import 'package:news_bloc/core/values/countries_enum.dart';
import 'package:news_bloc/core/values/strings.dart';

import '../../core/utility/data/result.dart';
import '../dto/response_dto/top_headlines_response_dto.dart';

class NewsApiDataSource {
  static NewsApiDataSource? _instance;
  late final Dio _api;

  NewsApiDataSource._internal({required NetworkRequester networkRequester}) {
    _api = networkRequester.dio;
  }

  factory NewsApiDataSource({required NetworkRequester networkRequester}) =>
      _instance ??=
          NewsApiDataSource._internal(networkRequester: networkRequester);

  Future<Result<TopHeadlinesResponseDto>> fetchNewsFromRemote() async {
    try {
      final Response response = await _api
          .get('', queryParameters: {'country': Country.india.countryCode()});
      return Result(data: TopHeadlinesResponseDto.fromJson(response.data));
    } on DioError catch (errorBody) {
      final TopHeadlinesResponseDto? topHeadlinesErrorResponse;
      if (errorBody.response?.data == null) {
        topHeadlinesErrorResponse = null;
      } else {
        topHeadlinesErrorResponse =
            TopHeadlinesResponseDto.fromJson(errorBody.response?.data);
      }

      final ApiException apiException;
      switch (errorBody.type) {
        case DioErrorType.response:
          {
            apiException = ApiException(
                errorMessage: topHeadlinesErrorResponse?.message ?? ErrorMessagesStrings.somethingWentWrong,
                statusCode: errorBody.response?.statusCode);
          }
          break;
        case DioErrorType.sendTimeout:
        case DioErrorType.connectTimeout:
          apiException = ApiException(
              errorMessage: ErrorMessagesStrings.noInternet,
              statusCode: errorBody.response?.statusCode);
          break;
        default:
          apiException = ApiException(
              errorMessage: ErrorMessagesStrings.somethingWentWrong,
              statusCode: errorBody.response?.statusCode);
      }
      return Result(error: apiException);
    }
  }
}
