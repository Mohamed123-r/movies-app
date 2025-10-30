import 'package:flutter/material.dart';
import 'package:movies_app/features/home/domain/entities/movie_entity.dart';
import 'package:movies_app/features/home/presentation/screen/widgets/favorite_item.dart';

import '../../../../constant.dart';
import '../../../../core/utils/app_text_style.dart';
import 'details_screen.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  static const routeName = "/favorite";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios),
            ),
          ),
        ),
        title: Text(
          "You Favorite Pets",
          style: AppTextStyles.style24Bold(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 80),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ValueListenableBuilder<List<MovieEntity>>(
                valueListenable: favoriteNotifier,
                builder: (context, favs, _) {
                  if (favs.isEmpty) {
                    return SizedBox(
                      height: 200,
                      child: Center(child: Text('No favorites yet')),
                    );
                  }
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: favs.length,
                    itemBuilder: (context, index) {
                      MovieEntity petList = favs[index];

                      return GestureDetector(
                        onTap: () async {
                          // يمكنك انتظار نتيجة من الشاشة التفصيلية لو أردت
                          await Navigator.pushNamed(
                            context,
                            DetailsScreen.routeName,
                            arguments: petList,
                          );
                          // لا حاجة لاعادة تحميل هنا لأن notifier سيحدث تلقائيًا من الـ Details إذا استُخدم toggleFavorite
                        },
                        child: FavoriteItem(movie: petList),
                      );
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      childAspectRatio: 0.8,
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
