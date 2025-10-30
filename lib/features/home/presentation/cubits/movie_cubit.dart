import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/home/domain/entities/movie_entity.dart';

import '../../domain/repo/movie_repo.dart';
import 'movie_status.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieCubit(this.movieRepo) : super(MovieInitial());

  final MovieRepo movieRepo;

  List<MovieEntity> movie = [];
  int _currentPage = 1;
  final int _pageSize = 10;
  bool _isLoading = false;
  bool _hasReachedEnd = false;

  bool get hasReachedEnd => _hasReachedEnd;

  Future<void> fetchMovies({bool isInitialLoad = false}) async {
    if (_isLoading || (!isInitialLoad && _hasReachedEnd)) return;

    _isLoading = true;

    if (isInitialLoad) {
      _currentPage = 1;
      _hasReachedEnd = false;
      movie.clear();
    }

    emit(MovieLoading());

    try {
      final newMovies = await movieRepo.getMovies(
        limit: _pageSize,
        page: _currentPage,
      );

      if (newMovies.length < _pageSize) {
        _hasReachedEnd = true;
      }

      movie.addAll(newMovies);
      _currentPage++;

      emit(MovieLoaded(List.from(movie), hasMore: !_hasReachedEnd));
    } catch (e) {
      emit(MovieError(e.toString()));
    } finally {
      _isLoading = false;
    }
  }

  Future<void> fetchNewMovies() async {
    if (_isLoading) return;

    emit(MovieLoading());
    try {
      final newBreeds = await movieRepo.getMovies(limit: _pageSize, page: 0);

      if (newBreeds.isNotEmpty && newBreeds.first.id != movie.first.id) {
        final uniqueNew = newBreeds
            .where((breed) => !movie.any((existing) => existing.id == breed.id))
            .toList();
        movie.insertAll(0, uniqueNew);
        emit(MovieLoaded(movie, hasMore: !_hasReachedEnd));
      }
    } catch (e) {
      emit(MovieError(e.toString()));
    }
  }

  Future<void> refreshMovies() async {
    await fetchMovies(isInitialLoad: true);
  }

  Future<void> searchMovies(String query) async {
    try {
      if (query.isEmpty) {
        fetchMovies(isInitialLoad: true);
        return;
      }
      final results = await movieRepo.searchBreeds(query: query);
      movie = results;
      _currentPage = 1;
      _hasReachedEnd = results.length < _pageSize;
      emit(MovieLoaded(movie, hasMore: !_hasReachedEnd));
    } catch (e) {
      emit(MovieError(e.toString()));
    } finally {
      _isLoading = false;
    }
  }
}
