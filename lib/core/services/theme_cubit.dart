// Updated ThemeCubit: emits ThemeMode.dark when isDark == true
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.light);

  /// Pass `true` to enable dark mode, `false` for light mode.
  void setDarkMode(bool isDark) {
    emit(isDark ? ThemeMode.dark : ThemeMode.light);
  }

  /// Toggle current mode.
  void toggle() {
    emit(state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark);
  }
}
