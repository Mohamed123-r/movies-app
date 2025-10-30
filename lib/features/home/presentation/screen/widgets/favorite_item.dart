import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/features/home/domain/entities/movie_entity.dart';
import 'package:movies_app/features/home/presentation/screen/widgets/product_item.dart';

import '../../../../../core/services/theme_cubit.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../generated/assets.dart';
import 'favorite_button.dart';

class FavoriteItem extends StatelessWidget {
  const FavoriteItem({super.key, required this.movie});

  final MovieEntity movie;

  @override
  Widget build(BuildContext context) {
    bool isDark = context.read<ThemeCubit>().state == ThemeMode.dark;

    return Container(
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
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,

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
          ),
          const SizedBox(height: 8),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.style14SemiBold(context),
                    ),
                    const SizedBox(height: 4),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(Assets.imagesLocation),
                        const SizedBox(width: 4),
                        Text(
                          movie.originalLanguage,
                          style: AppTextStyles.style12Regular(context).copyWith(
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
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: FavoriteButton(pet: movie),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
