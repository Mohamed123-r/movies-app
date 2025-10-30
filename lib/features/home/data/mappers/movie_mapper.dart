import '../../domain/entities/movie_entity.dart';
import '../models/movie_model.dart' hide Weight;

extension MovieModelMapper on MovieModel {
  MovieEntity toEntity() => MovieEntity(
    adult: adult ?? false,
    backdropPath: backdropPath ?? '',
    genreIds: genreIds ?? [],
    id: id ?? 0,
    originalLanguage: originalLanguage ?? '',
    originalTitle: originalTitle ?? '',
    overview: overview ?? '',
    popularity: popularity?.toDouble() ?? 0.0,
    posterPath: posterPath ?? '',
    releaseDate: releaseDate ?? '',
    title: title ?? '',
    video: video ?? false,
    voteAverage: voteAverage?.toDouble() ?? 0.0,
    voteCount: voteCount ?? 0,
  );
}

extension BreedEntityMapper on MovieEntity {
  Map<String, dynamic> toJson() => {
    'adult': adult,
    'backdrop_path': backdropPath,
    'genre_ids': genreIds,
    'id': id,
    'original_language': originalLanguage,
    'original_title': originalTitle,
    'overview': overview,
    'popularity': popularity,
    'poster_path': posterPath,
    'release_date': releaseDate,
    'title': title,
    'video': video,
    'vote_average': voteAverage,
    'vote_count': voteCount,
  };
}
