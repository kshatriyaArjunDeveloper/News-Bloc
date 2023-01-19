import 'package:dio/dio.dart';

import '../../values/data_constants.dart';

class NetworkRequester {
  late final Dio dio;

  NetworkRequester() {
    final _baseOptions = BaseOptions(
      baseUrl: Urls.baseURL,
      connectTimeout: Timeouts.connectTimeout,
      receiveTimeout: Timeouts.receiveTimeout,
      headers: {'X-Api-Key': Keys.apiKey},
    );

    final logInterceptor = LogInterceptor(
      requestBody: true,
      responseBody: true,
    );

    dio = Dio(_baseOptions);
    dio.interceptors.add(logInterceptor);
  }
}
