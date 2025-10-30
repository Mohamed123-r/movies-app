import 'package:movies_app/features/home/domain/entities/movie_entity.dart';

abstract class MovieState {}

class MovieInitial extends MovieState {}

class MovieLoading extends MovieState {}

class MovieLoaded extends MovieState {
  final List<MovieEntity> breeds;
  final bool hasMore;
  MovieLoaded(this.breeds, {required this.hasMore});
}

class MovieError extends MovieState {
  final String message;
  MovieError(this.message);
}
