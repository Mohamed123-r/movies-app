import 'package:dio/dio.dart';
import '../../constant.dart';
import '../errors/exceptions.dart';
import 'api_consumer.dart';
import 'api_interceptor.dart';
import 'end_point.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.options.baseUrl = EndPoint.baseUrl;
    dio.interceptors.add(ApiInterceptor());
    dio.interceptors.add(
      LogInterceptor(
        error: true,
        requestBody: true,
        responseBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }

  @override
  Future delete(String path) async {
    try {
      final response = await dio.delete(path);
      return response.data;
    } on DioException catch (e) {
      logger.e(" DioException: ${e.response?.data ?? e.message}");
      return handelExceptions(e);
    }
  }

  @override
  Future get(String path) async {
    try {
      final response = await dio.get(path);
      return response.data;
    } on DioException catch (e) {
      logger.e(" DioException: ${e.response?.data ?? e.message}");
      return handelExceptions(e);
    }
  }

  @override
  Future patch(
    String path, {
    Map<String, dynamic>? data,
    bool formData = false,
  }) async {
    try {
      final response = await dio.patch(
        path,
        data: formData ? FormData.fromMap(data!) : data,
      );
      return response.data;
    } on DioException catch (e) {
      logger.e(" DioException: ${e.response?.data ?? e.message}");
      return handelExceptions(e);
    }
  }

  @override
  Future post(
    String path, {
    Map<String, dynamic>? data,
    bool formData = false,
  }) async {
    try {
      final response = await dio.post(
        path,
        data: formData ? FormData.fromMap(data!) : data,
      );

      return response.data;
    } on DioException catch (e) {
      logger.e(" DioException: ${e.response?.data ?? e.message}");
      return handelExceptions(e);
    }
  }

  @override
  Future put(
    String path, {
    Map<String, dynamic>? data,
    bool formData = false,
  }) async {
    try {
      final response = await dio.put(
        path,
        data: formData ? FormData.fromMap(data!) : data,
      );
      return response.data;
    } on DioException catch (e) {
      logger.e(" DioException: ${e.response?.data ?? e.message}");
      return handelExceptions(e);
    }
  }
}


