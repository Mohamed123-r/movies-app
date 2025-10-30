import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/app_color.dart';

import 'constant.dart';
import 'core/api/bloc_opesever.dart';
import 'core/database/cache/cache_helper.dart';
import 'core/helper_functions/get_it.dart';
import 'core/helper_functions/on_generate_route.dart';
import 'core/services/theme_cubit.dart';
import 'features/splash/persentation/screen/splash_screen.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();

  setupGetIt();
  await CacheHelper().init();
  Bloc.observer = CustomBlocObserver();
  loadFavorites();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ThemeCubit(), // don't force toggle here; control via UI or saved preference
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, mode) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              brightness: Brightness.light,
              scaffoldBackgroundColor: AppColors.whiteColor,
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              scaffoldBackgroundColor: AppColors.black20Color,
            ),
            themeMode: mode,
            initialRoute: SplashScreen.routeName,
            onGenerateRoute: onGenerateRoute,
          );
        },
      ),
    );
  }
}
