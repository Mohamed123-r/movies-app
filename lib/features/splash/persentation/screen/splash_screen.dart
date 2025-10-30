import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/theme_cubit.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../generated/assets.dart';
import '../../../home/presentation/screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String routeName = '/splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(
        context,
        //   CacheHelper.sharedPreferences.getBool(kIsLogin) == true
        //       ? HomeScreen.routeName
        //       :
        HomeScreen.routeName,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = context.read<ThemeCubit>().state == ThemeMode.dark;

    return Container(
      color: isDark ? AppColors.whiteColorDarkMode : AppColors.whiteColor,
      child: Center(
        child: Image.asset(Assets.imagesHeart, width: 200, height: 180),
      ),
    );
  }
}
