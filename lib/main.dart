import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'config/routes/router.dart';
import 'src/features/country/presentation/providers/theme_provider.dart';

void main() {
  runApp(const ProviderScope(child: App()));
}

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => MaterialApp.router(
        routerConfig: router,
        theme: ref.watch(themeNotifierProvider).getTheme(),
      );
}
