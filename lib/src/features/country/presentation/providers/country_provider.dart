import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/entities.dart';
import '../../infrastructure/data_sources/data_sources.dart';
import '../../infrastructure/repositories_impl/country_repository_impl.dart';

final _dataSource = ProjectDataSource();
final _repositoryImpl = CountryRepositoryImpl(_dataSource);

final countryNotifierProvider =
    StateNotifierProvider<CountryNotifier, Country>((ref) => CountryNotifier());

class CountryNotifier extends StateNotifier<Country> {
  CountryNotifier() : super(Country.empty());

  void clearCountry() => state = Country.empty();
  void getCountryByName(String name) async =>
      state = await _repositoryImpl.getCountryByName(name);
}
