import '../../domain/entities/country.dart';
import '../models/rest_countries/country/country_models.dart';

class CountryMapper {
  static Country restCountriesCountryToEntity(RestCountriesCountry country) {
    final borderCountries = country.borders!.toList();

    final capital =
        country.capital!.isEmpty ? 'No borders' : country.capital![0];

    final currencies = country.currencies == null
        ? ['No currencies']
        : country.currencies!
            .toMap()
            .values
            .map((currency) =>
                currency == null ? '' : currency["name"].toString())
            .toList();

    final languages = country.languages == null
        ? ['No languages']
        : country.languages!.values.toList();

    final nativeName = country.name.nativeName!.values.isEmpty
        ? 'No native name'
        : country.name.nativeName!.values.toList()[0].common;

    final topLevelDomain = country.tld!.map((tld) => tld.toString()).toList();

    return Country(
      borderCountries: borderCountries,
      capital: capital,
      currencies: currencies,
      flagUrl: country.flags.png,
      languages: languages,
      name: country.name.common,
      nativeName: nativeName,
      population: country.population,
      region: country.region.name,
      subregion: country.subregion,
      topLevelDomain: topLevelDomain,
    );
  }
}
