import 'package:movies_app/features/home/domain/entities/movie_entity.dart';

import '../../domain/repo/movie_repo.dart';
import '../api_sources/movie_api_sources.dart';
import '../mappers/movie_mapper.dart';
import '../models/movie_model.dart';

class MovieRepoImpl implements MovieRepo {
  final MovieApiService apiService;

  MovieRepoImpl({required this.apiService});

  @override
  Future<List<MovieEntity>> getMovies({int limit = 10, int page = 1}) async {
    final response = await apiService.fetchMovies(limit: limit, page: page);
    final models = (response as List)
        .map((json) => MovieModel.fromJson(json))
        .toList();
    final entities = models.map((model) => model.toEntity()).toList();
    return entities;
  }

  @override
  Future<List<MovieEntity>> searchBreeds({required String query}) async {
    final response = await apiService.searchMovies(query: query);
    final models = (response).map((json) => MovieModel.fromJson(json)).toList();
    final entities = models.map((model) => model.toEntity()).toList();
    return entities;
  }
}
