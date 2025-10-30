import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../constant.dart';
import '../../../../../generated/assets.dart';
import '../../../domain/entities/movie_entity.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({super.key, required this.pet});

  final MovieEntity pet;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<MovieEntity>>(
      valueListenable: favoriteNotifier,
      builder: (context, favs, _) {
        final isFav = favs.any((e) => e.id == pet.id);
        return IconButton(
          onPressed: () async {
            await toggleFavorite(pet);
            // لا حاجة لـ setState هنا لأن notifier سيُعيد بناء الـ ValueListenableBuilder
          },
          icon: isFav
              ? SvgPicture.asset(Assets.imagesHeart2)
              : SvgPicture.asset(Assets.imagesHeart1),
        );
      },
    );
  }
}
