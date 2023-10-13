import '../entities/country.dart';

abstract class CountryDataSource {
  Future<List<Country>> getAllCountries();
  Future<Country> getCountryByName(String name);
}
