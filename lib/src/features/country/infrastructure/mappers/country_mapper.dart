import '../../domain/entities/country.dart';
import '../models/models.dart';

class CountryMapper {
  static Country restCountriesCountryToEntity(RestCountriesCountry country) {
    final borderCountries = country.borders!.toList();

    final capital =
        country.capital!.isEmpty ? 'No capital' : country.capital![0];

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

  static Country projectCountryToEntity(ProjectCountry country) {
    final borderCountries = country.borders!.toList();

    final capital = country.capital ?? 'No capital';

    final currencies = country.currencies!
        .map((currency) => currency.name.toString())
        .toList();

    final languages =
        country.languages.map((language) => language.name.toString()).toList();

    final region = country.region.name[0].toUpperCase() +
        country.region.name.toLowerCase().substring(1);

    return Country(
      borderCountries: borderCountries,
      capital: capital,
      currencies: currencies,
      flagUrl: country.flags.png,
      languages: languages,
      name: country.name,
      nativeName: country.nativeName,
      population: country.population,
      region: region,
      subregion: country.subregion,
      topLevelDomain: country.topLevelDomain,
    );
  }
}
