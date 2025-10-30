import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);
    options.headers['token'] = null;
    options.headers['lang'] = 'en';
    options.headers['Authorization'] =
        'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyOTQ0NDY3YTI5MDMzYzg1YTBjMThiMGMxN2FhNmYzZiIsIm5iZiI6MTc2MTc5ODMyNy4zODEsInN1YiI6IjY5MDJlOGI3MzRiYjAzNWU3NTA5Y2NkMiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Ra4VB0LTv5mxjMA5EQpvGoHTV1d9Ha-NVppaMb7wqGg';
  }
}
