import 'package:movies_app/features/home/domain/entities/movie_entity.dart';

abstract class MovieRepo {
  Future<List<MovieEntity>> getMovies({int limit = 10, int page = 1});
  Future<List<MovieEntity>> searchBreeds({required String query});
}
