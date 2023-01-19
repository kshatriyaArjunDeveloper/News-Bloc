import 'package:dio/dio.dart';

import '../../../utility/data/exception_handler.dart';
import '../../../utility/data/result.dart';
import '../../../values/countries_enum.dart';
import '../../../values/strings.dart';
import '../../dto/news_headlines/response_dto/top_headlines_response_dto.dart';

class NewsApiRemoteDataSource {
  late final Dio _api;

  NewsApiRemoteDataSource({required Dio dio}) {
    _api = dio;
  }

  Future<Result<TopHeadlinesResponseDto>> fetchNewsFromRemote() async {
    try {
      final response = await _api
          .get('', queryParameters: {'country': Country.india.countryCode()});

      final topHeadlinesResponseData =
          TopHeadlinesResponseDto.fromJson(response.data);
      return Result(data: topHeadlinesResponseData);
    } on DioError catch (errorBody) {
      try {
        final String? responseError;
        final isResponseNull = errorBody.response?.data == null;
        responseError = isResponseNull
            ? null
            : TopHeadlinesResponseDto.fromJson(errorBody.response?.data)
                .message;
        return Result<TopHeadlinesResponseDto>(
          error: ExceptionHandler.getException(errorBody, responseError),
        );
      } catch (error) {
        return Result<TopHeadlinesResponseDto>(
          error: ExceptionHandler.getException(
              errorBody, ErrorMessagesStrings.somethingWentWrong),
        );
      }
    }
  }
}
