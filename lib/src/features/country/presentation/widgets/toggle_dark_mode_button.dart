import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/theme_provider.dart';

class ToggleDarkModeButton extends ConsumerWidget {
  const ToggleDarkModeButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton.icon(
      onPressed: () =>
          ref.read(themeNotifierProvider.notifier).toggleDarkMode(),
      icon: const Icon(Icons.nightlight_rounded),
      label: const Text('Dark Mode'),
      style: const ButtonStyle(
        foregroundColor: MaterialStatePropertyAll(Colors.white),
      ),
    );
  }
}
