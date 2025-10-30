import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/core/utils/app_color.dart';
import 'package:movies_app/features/home/domain/entities/movie_entity.dart';
import 'package:movies_app/features/home/presentation/screen/widgets/favorite_button.dart';
import 'package:movies_app/features/home/presentation/screen/widgets/product_item.dart';

import '../../../../core/services/theme_cubit.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../generated/assets.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.movieEntity});

  static const String routeName = '/detail';

  final MovieEntity movieEntity;

  @override
  Widget build(BuildContext context) {
    bool isDark = context.read<ThemeCubit>().state == ThemeMode.dark;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: isDark
                    ? AppColors.tealColorDarkMode
                    : AppColors.tealColor,
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: FavoriteButton(pet: movieEntity),
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 375,
              width: double.infinity,
              decoration: BoxDecoration(
                color: isDark
                    ? AppColors.teal2ColorDarkMode
                    : AppColors.teal2Color,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
                child: Image.network(
                  movieEntity.backdropPath.toImageUrl(),
                  height: 375,
                  errorBuilder: (context, error, stackTrace) =>
                      Icon(Icons.error),
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          movieEntity.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.style28Bold(context),
                        ),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(Assets.imagesLocation),
                          const SizedBox(width: 4),
                          Text(
                            movieEntity.originalLanguage,
                            style: AppTextStyles.style14Regular(context)
                                .copyWith(
                                  color: isDark
                                      ? AppColors.greyColor
                                      : AppColors.greyColor,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 75,

                            decoration: BoxDecoration(
                              color: isDark
                                  ? AppColors.teal2ColorDarkMode
                                  : AppColors.teal2Color,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Popularity",
                                  style: AppTextStyles.style18Medium(context),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "(${movieEntity.popularity}) ",
                                  style: AppTextStyles.style16Regular(context)
                                      .copyWith(
                                        color: isDark
                                            ? AppColors.greyColorDarkMode
                                            : AppColors.greyColor,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Container(
                            height: 75,

                            decoration: BoxDecoration(
                              color: isDark
                                  ? AppColors.teal2ColorDarkMode
                                  : AppColors.teal2Color,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Release Date",
                                  style: AppTextStyles.style18Medium(context),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "(${movieEntity.releaseDate}) ",
                                  style: AppTextStyles.style16Regular(context)
                                      .copyWith(
                                        color: isDark
                                            ? AppColors.greyColorDarkMode
                                            : AppColors.greyColor,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'About :',
                        style: AppTextStyles.style22SemiBold(context),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        movieEntity.overview,
                        style: AppTextStyles.style16Regular(context).copyWith(
                          color: isDark
                              ? AppColors.greyColorDarkMode
                              : AppColors.greyColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
