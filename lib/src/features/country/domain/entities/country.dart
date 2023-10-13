class Country {
  // Common - Show in country list
  final String? flagUrl;
  final String name;
  final int population;
  final String region;
  final String capital;

  // Country details
  final String? nativeName;
  final String? subregion;
  final List<String> topLevelDomain;
  final List<String> currencies;
  final List<String> languages;
  final List<String> borderCountries;

  Country({
    required this.borderCountries,
    required this.capital,
    required this.currencies,
    required this.flagUrl,
    required this.languages,
    required this.name,
    required this.nativeName,
    required this.population,
    required this.region,
    required this.subregion,
    required this.topLevelDomain,
  });

  @override
  String toString() =>
      'Country(borderCountries: $borderCountries, capital: $capital, currencies: $currencies, flagUrl: $flagUrl, languages: $languages, name: $name, nativeName: $nativeName, population: $population, region: $region, subregion: $subregion, topLevelDomain: $topLevelDomain)';

  Map<String, dynamic> toMap() => {
        'borderCountries': borderCountries,
        'capital': capital,
        'currencies': currencies,
        'flagUrl': flagUrl,
        'languages': languages,
        'name': name,
        'nativeName': nativeName,
        'population': population,
        'region': region,
        'subregion': subregion,
        'topLevelDomain': topLevelDomain,
      };
}
