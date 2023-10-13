import 'package:go_router/go_router.dart';
import 'package:rest_countries_api/src/features/country/presentation/screens/home_screen.dart';

final routes = <GoRoute>[
  GoRoute(
    path: HomeScreen.path,
    builder: (context, state) => const HomeScreen(),
    name: HomeScreen.name,
  ),
];
