import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../config/themes/default_theme.dart';

final themeNotifierProvider =
    StateNotifierProvider<ThemeNotifier, DefaultTheme>(
        (ref) => ThemeNotifier());

class ThemeNotifier extends StateNotifier<DefaultTheme> {
  ThemeNotifier() : super(DefaultTheme());

  void toggleDarkMode() =>
      state = state.copyWith(isDarkMode: !state.isDarkMode);
}
