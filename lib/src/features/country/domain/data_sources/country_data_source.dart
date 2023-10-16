import '../entities/country.dart';

abstract class CountryDataSource {
  Future<List<Country>> getAllCountries();
  Future<Country> getCountryByCode(String code);
  Future<Country> getCountryByName(String name);
}
