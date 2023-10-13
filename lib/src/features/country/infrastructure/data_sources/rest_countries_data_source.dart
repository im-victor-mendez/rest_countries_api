import '../../domain/data_sources/country_data_source.dart';
import '../../domain/entities/country.dart';

class RESTCountriesDataSource extends CountryDataSource {
  @override
  Future<List<Country>> getAllCountries() {
    // TODO: implement getAllCountries
    throw UnimplementedError();
  }

  @override
  Future<Country> getCountryByName(String name) {
    // TODO: implement getCountryByName
    throw UnimplementedError();
  }
}
