import 'package:flutter/material.dart';

import 'config/routes/router.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        routerConfig: router,
      );
}
