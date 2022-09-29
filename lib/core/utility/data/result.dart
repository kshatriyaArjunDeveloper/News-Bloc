class Result<T> {
  final ApiException? error;
  final T? data;

  Result({this.error, this.data});
}

class ApiException implements Exception {
  final String errorMessage;
  final int? statusCode;

  ApiException({required this.errorMessage, this.statusCode});
}
