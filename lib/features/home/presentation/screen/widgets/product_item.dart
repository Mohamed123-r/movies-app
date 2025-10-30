import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/core/utils/app_color.dart';
import 'package:movies_app/core/utils/app_text_style.dart';
import 'package:movies_app/features/home/domain/entities/movie_entity.dart';
import 'package:movies_app/generated/assets.dart';

import '../../../../../core/services/theme_cubit.dart';
import 'favorite_button.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.movie});

  final MovieEntity movie;

  @override
  Widget build(BuildContext context) {
    bool isDark = context.read<ThemeCubit>().state == ThemeMode.dark;

    return Stack(
      alignment: AlignmentGeometry.topRight,
      children: [
        Container(
          decoration: BoxDecoration(
            color: isDark ? AppColors.whiteColorDarkMode : AppColors.whiteColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: isDark
                    ? AppColors.greyColorDarkMode.withOpacity(0.3)
                    : AppColors.greyColor.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),

          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              Container(
                height: 112,
                width: 112,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: isDark
                      ? AppColors.teal2ColorDarkMode
                      : AppColors.teal2Color,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    movie.backdropPath.toImageUrl()!,
                    errorBuilder: (context, error, stackTrace) =>
                        Icon(Icons.error),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 16),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.style18Bold(context),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "${movie.popularity} ",
                      style: AppTextStyles.style14Regular(context).copyWith(
                        color: isDark
                            ? AppColors.greyColorDarkMode
                            : AppColors.greyColor,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      movie.releaseDate,

                      style: AppTextStyles.style14Regular(context).copyWith(
                        color: isDark
                            ? AppColors.greyColorDarkMode
                            : AppColors.greyColor,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        SvgPicture.asset(Assets.imagesLocation),
                        const SizedBox(width: 4),
                        Text(
                          movie.originalLanguage,
                          style: AppTextStyles.style14Regular(context).copyWith(
                            color: isDark
                                ? AppColors.greyColorDarkMode
                                : AppColors.greyColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        FavoriteButton(pet: movie),
      ],
    );
  }
}

extension ImageUrlX on String {
  String toImageUrl() {
    return 'https://cdn2.thecatapi.com/images/$this.jpg';
  }
}
