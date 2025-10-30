import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/app_color.dart';
import 'package:movies_app/features/home/domain/entities/movie_entity.dart';
import 'package:movies_app/features/home/presentation/screen/widgets/product_item.dart';

import '../../../../../core/services/theme_cubit.dart';
import '../details_screen.dart';

class HomeProductsSection extends StatelessWidget {
  final List<MovieEntity> movies;
  final bool isLoading;

  const HomeProductsSection({
    super.key,
    required this.movies,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = context.read<ThemeCubit>().state == ThemeMode.dark;

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      sliver: SliverList.separated(
        itemCount: movies.length + (isLoading ? 1 : 0),
        separatorBuilder: (_, __) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          if (index < movies.length) {
            final movie = movies[index];
            return Padding(
              padding: EdgeInsets.only(top: index == 0 ? 16 : 0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    DetailsScreen.routeName,
                    arguments: movie,
                  );
                },
                child: ProductItem(movie: movie),
              ),
            );
          }
          return Padding(
            padding: EdgeInsets.all(16.0),
            child: Center(
              child: CircularProgressIndicator(
                color: isDark
                    ? AppColors.teal2ColorDarkMode
                    : AppColors.tealColor,
              ),
            ),
          );
        },
      ),
    );
  }
}
