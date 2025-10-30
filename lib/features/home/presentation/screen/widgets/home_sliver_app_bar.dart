import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/core/utils/app_color.dart';
import 'package:movies_app/core/utils/app_text_style.dart';
import 'package:movies_app/features/home/presentation/screen/favorite_screen.dart';
import 'package:movies_app/generated/assets.dart';

import '../../../../../core/services/theme_cubit.dart';

class HomeSliverAppBar extends StatefulWidget {
  const HomeSliverAppBar({
    super.key,
    required TextEditingController searchController,
    required Function(String) onSearchChanged,
  }) : _searchController = searchController,
       _onSearchChanged = onSearchChanged;

  final TextEditingController _searchController;
  final Function(String) _onSearchChanged;

  @override
  State<HomeSliverAppBar> createState() => _HomeSliverAppBarState();
}

class _HomeSliverAppBarState extends State<HomeSliverAppBar> {
  @override
  Widget build(BuildContext context) {
    bool isDark = context.read<ThemeCubit>().state == ThemeMode.dark;

    return SliverAppBar(
      automaticallyImplyLeading: false,
      floating: true,
      pinned: true,
      snap: true,
      title: Text(
        "Find Your Forever Movies",
        style: AppTextStyles.style22SemiBold(context),
      ),
      actions: [
        // Use BlocBuilder to rebuild icon/colors based on ThemeCubit state
        BlocBuilder<ThemeCubit, ThemeMode>(
          builder: (context, themeMode) {
            return IconButton(
              icon: Icon(
                // Show an icon representing current mode (adjust to your preference)
                isDark ? Icons.dark_mode : Icons.light_mode,
                color: isDark
                    ? AppColors.black20ColorDarkMode
                    : AppColors.black20Color,
              ),
              onPressed: () {
                // Toggle the theme in the cubit
                context.read<ThemeCubit>().toggle();
              },
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: IconButton(
            icon: SvgPicture.asset(
              Assets.imagesHeart2,
              color: isDark
                  ? AppColors.black20ColorDarkMode
                  : AppColors.black20Color,
            ),
            onPressed: () {
              Navigator.pushNamed(context, FavoriteScreen.routeName);
            },
          ),
        ),
      ],
      backgroundColor: Colors.transparent,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(72),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: ValueListenableBuilder<TextEditingValue>(
            valueListenable: widget._searchController,
            builder: (context, value, child) {
              return Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: widget._searchController,
                      onChanged: widget._onSearchChanged,
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        hintStyle: AppTextStyles.style16Regular(
                          context,
                        ).copyWith(color: AppColors.greyColor),
                        prefixIcon: SvgPicture.asset(
                          Assets.imagesSearch,
                          fit: BoxFit.scaleDown,
                        ),
                        suffixIcon: value.text.isNotEmpty
                            ? IconButton(
                                icon: Icon(
                                  Icons.clear,
                                  color: isDark
                                      ? AppColors.redColorDarkMode
                                      : AppColors.redColor,
                                ),
                                onPressed: () {
                                  widget._searchController.clear();
                                  widget._onSearchChanged('');
                                },
                              )
                            : null,
                        filled: true,
                        fillColor: isDark
                            ? AppColors.greyColorDarkMode
                            : AppColors.greyColor.withOpacity(0.1),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
