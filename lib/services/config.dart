import 'package:dio/dio.dart';

const _baseUrl = 'https://api.appworks-school.tw/api/1.0';

final dio = Dio(
  BaseOptions(
    baseUrl: _baseUrl,
    // Timeout for opening url
    connectTimeout: const Duration(seconds: 5),
    // Whenever more than [receiveTimeout] passes between two events from response stream,
    // [Dio] will throw the [DioError] with [DioErrorType.RECEIVE_TIMEOUT].
    receiveTimeout: const Duration(seconds: 5),
  ),
);
