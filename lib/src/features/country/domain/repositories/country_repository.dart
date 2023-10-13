import '../entities/country.dart';

abstract class CountryRepository {
  Future<List<Country>> getAllCountries();
  Future<Country> getCountryByName(String name);
}
