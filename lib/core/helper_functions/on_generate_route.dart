import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/helper_functions/get_it.dart';
import 'package:movies_app/features/home/domain/entities/movie_entity.dart';
import 'package:movies_app/features/home/domain/repo/movie_repo.dart';
import 'package:movies_app/features/home/presentation/cubits/movie_cubit.dart';

import '../../features/home/presentation/screen/details_screen.dart';
import '../../features/home/presentation/screen/favorite_screen.dart';
import '../../features/home/presentation/screen/home_screen.dart';
import '../../features/splash/persentation/screen/splash_screen.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashScreen.routeName:
      return MaterialPageRoute(builder: (_) => SplashScreen());

    case HomeScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => BlocProvider(
          child: HomeScreen(),
          create: (context) => MovieCubit(getIt.get<MovieRepo>()),
        ),
      );
    case DetailsScreen.routeName:
      return MaterialPageRoute(
        builder: (_) =>
            DetailsScreen(movieEntity: settings.arguments as MovieEntity),
      );
    case FavoriteScreen.routeName:
      return MaterialPageRoute(builder: (_) => FavoriteScreen());

    default:
      return MaterialPageRoute(builder: (_) => Container());
  }
}
