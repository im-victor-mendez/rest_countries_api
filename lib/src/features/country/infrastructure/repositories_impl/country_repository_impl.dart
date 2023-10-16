import '../../domain/data_sources/country_data_source.dart';
import '../../domain/entities/country.dart';
import '../../domain/repositories/country_repository.dart';

class CountryRepositoryImpl implements CountryRepository {
  final CountryDataSource dataSource;

  CountryRepositoryImpl(this.dataSource);

  @override
  Future<List<Country>> getAllCountries() async =>
      await dataSource.getAllCountries();

  @override
  Future<Country> getCountryByCode(String code) async =>
      await dataSource.getCountryByCode(code);

  @override
  Future<Country> getCountryByName(String name) async =>
      await dataSource.getCountryByName(name);
}
