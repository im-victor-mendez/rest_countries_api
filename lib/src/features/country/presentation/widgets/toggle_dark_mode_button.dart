import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/theme_provider.dart';

class ToggleDarkModeButton extends ConsumerWidget {
  const ToggleDarkModeButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;

    return TextButton.icon(
      onPressed: () =>
          ref.read(themeNotifierProvider.notifier).toggleDarkMode(),
      icon: Icon(isDarkMode ? Icons.nightlight_rounded : Icons.sunny),
      label: Text(isDarkMode ? 'Dark Mode' : 'White Mode'),
      style: const ButtonStyle(
        foregroundColor: MaterialStatePropertyAll(Colors.white),
      ),
    );
  }
}
