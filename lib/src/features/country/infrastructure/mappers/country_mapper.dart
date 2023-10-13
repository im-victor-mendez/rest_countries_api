import '../../domain/entities/country.dart';
import '../models/rest_countries/country/country_models.dart';

class CountryMapper {
  static List<Country> restCountriesAllToEntity(
    List<RestCountriesCountry> response,
  ) =>
      response
          .map((country) => Country(
                borderCountries: country.borders ?? [],
                capital: country.capital![0],
                // To view possible problems with this
                currencies: (country.currencies as Map<String, dynamic>)
                    .values
                    .map((currency) => currency['name'].toString())
                    .toList(),
                flagUrl: country.flags.png,
                languages: country.languages!.values.toList(),
                name: country.name.common,
                nativeName: country.name.nativeName!.values.toList()[0].common,
                population: country.population,
                region: country.region.name,
                subregion: country.subregion,
                topLevelDomain:
                    country.tld!.map((tld) => tld.toString()).toList(),
              ))
          .toList();
}
