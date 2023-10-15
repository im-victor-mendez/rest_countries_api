import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/country.dart';
import '../../infrastructure/data_sources/data_sources.dart';
import '../../infrastructure/repositories_impl/country_repository_impl.dart';

final _dataSource = ProjectDataSource();
final _repositoryImpl = CountryRepositoryImpl(_dataSource);

final countryListNotifierProvider =
    StateNotifierProvider<CountryListNotifier, List<Country>>(
        (ref) => CountryListNotifier());

class CountryListNotifier extends StateNotifier<List<Country>> {
  CountryListNotifier() : super([]);

  void clearList() => state = [];
  void getList() async => state = await _repositoryImpl.getAllCountries();
}
