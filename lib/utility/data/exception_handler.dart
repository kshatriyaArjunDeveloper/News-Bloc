import 'package:dio/dio.dart';
import 'package:news_bloc/utility/data/result.dart';

import '../../values/strings.dart';

class ExceptionHandler {
  ExceptionHandler._privateConstructor();

  static ApiException getException(DioError errorBody, String? responseError) {
    final ApiException apiException;
    switch (errorBody.type) {
      case DioErrorType.response:
        apiException = ApiException(
            errorMessage:
                responseError ?? ErrorMessagesStrings.somethingWentWrong,
            statusCode: errorBody.response?.statusCode);
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
    return apiException;
  }
}
