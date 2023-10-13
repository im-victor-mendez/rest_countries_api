import 'package:flutter/material.dart';

class DefaultTheme {
  bool isDarkMode;

  DefaultTheme({this.isDarkMode = true});

  ThemeData getTheme() =>
      ThemeData(brightness: isDarkMode ? Brightness.dark : Brightness.light);

  DefaultTheme copyWith({bool? isDarkMode}) =>
      DefaultTheme(isDarkMode: isDarkMode ?? this.isDarkMode);
}
