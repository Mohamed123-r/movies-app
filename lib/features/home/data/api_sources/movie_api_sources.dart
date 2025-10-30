import 'package:movies_app/core/api/dio_consumer.dart';
import 'package:movies_app/core/api/end_point.dart';

class MovieApiService {
  final DioConsumer dioConsumer;

  MovieApiService({required this.dioConsumer});

  fetchMovies({int limit = 10, int page = 1}) async {
    final response = await dioConsumer.get('${EndPoint.movie}?page=$page');

    return response["results"];
  }

  Future<List<dynamic>> searchMovies({required String query}) async {
    final response = await dioConsumer.get('/v1/breeds/search?q=$query');
    return response;
  }
}
