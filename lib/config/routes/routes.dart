import 'package:go_router/go_router.dart';

import '../../src/features/country/presentation/screens/screens.dart';

final routes = <GoRoute>[
  GoRoute(
    builder: (context, state) => const HomeScreen(),
    name: HomeScreen.name,
    path: HomeScreen.path,
  ),
  GoRoute(
    builder: (context, state) =>
        CountryScreen(countryName: state.pathParameters['countryName']),
    name: CountryScreen.name,
    path: CountryScreen.path,
  ),
];
