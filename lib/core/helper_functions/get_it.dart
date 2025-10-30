import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_app/features/home/data/api_sources/movie_api_sources.dart';

import '../../features/home/data/repo_impl/movie_repo_impl.dart';
import '../../features/home/domain/repo/movie_repo.dart';
import '../api/dio_consumer.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerLazySingleton<DioConsumer>(() => DioConsumer(dio: Dio()));
  getIt.registerLazySingleton<MovieApiService>(
    () => MovieApiService(dioConsumer: getIt.get<DioConsumer>()),
  );
  getIt.registerLazySingleton<MovieRepo>(
    () => MovieRepoImpl(apiService: getIt.get<MovieApiService>()),
  );
}
