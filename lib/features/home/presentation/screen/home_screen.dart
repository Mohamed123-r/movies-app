import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/home/presentation/screen/widgets/home_sliver_app_bar.dart';

import '../../../../core/services/theme_cubit.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_text_style.dart';
import '../cubits/movie_cubit.dart';
import '../cubits/movie_status.dart';
import 'widgets/home_products_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<MovieCubit>().fetchMovies(isInitialLoad: true);
  }

  Future<void> _onRefresh() async {
    await context.read<MovieCubit>().refreshMovies();
  }

  bool _onScrollNotification(ScrollNotification notification) {
    final cubit = context.read<MovieCubit>();

    if (notification is ScrollUpdateNotification) {
      final maxScroll = notification.metrics.maxScrollExtent;
      final currentScroll = notification.metrics.pixels;

      if (currentScroll >= maxScroll - 200 && !cubit.hasReachedEnd) {
        cubit.fetchMovies();
      }
    }

    return false;
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = context.read<ThemeCubit>().state == ThemeMode.dark;

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        color: isDark ? AppColors.tealColorDarkMode : AppColors.tealColor,
        child: NotificationListener<ScrollNotification>(
          onNotification: _onScrollNotification,
          child: CustomScrollView(
            controller: _scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              HomeSliverAppBar(
                searchController: _searchController,
                onSearchChanged: (query) {},
              ),
              BlocConsumer<MovieCubit, MovieState>(
                listener: (context, state) {},
                builder: (context, state) {
                  final cubit = context.read<MovieCubit>();
                  final movies = cubit.movie;

                  if (state is MovieLoading && movies.isEmpty) {
                    return SliverFillRemaining(
                      child: Center(
                        child: CircularProgressIndicator(
                          color: isDark
                              ? AppColors.tealColorDarkMode
                              : AppColors.tealColor,
                        ),
                      ),
                    );
                  }

                  if (state is MovieError) {
                    return SliverFillRemaining(
                      child: Center(
                        child: Text(
                          'Error: ${state.message}',
                          style: AppTextStyles.style18Medium(context).copyWith(
                            color: isDark
                                ? AppColors.redColorDarkMode
                                : AppColors.redColor,
                          ),
                        ),
                      ),
                    );
                  }

                  if (movies.isEmpty) {
                    return SliverFillRemaining(
                      child: Center(
                        child: Text(
                          'No movies available',
                          style: AppTextStyles.style18Medium(context),
                        ),
                      ),
                    );
                  }

                  return HomeProductsSection(
                    movies: movies,
                    isLoading: state is MovieLoading,
                  );
                },
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 20)),
            ],
          ),
        ),
      ),
    );
  }
}
