import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../../config/constants/api.dart';
import '../../domain/data_sources/country_data_source.dart';
import '../../domain/entities/country.dart';
import '../mappers/country_mapper.dart';
import '../models/rest_countries/country/country_models.dart';

class RESTCountriesDataSource extends CountryDataSource {
  @override
  Future<List<Country>> getAllCountries() async {
    final uri = Uri.parse('${ConstantsApi.restCountries}/all');
    final response = await http.get(uri);
    final body = json.decode(response.body) as List;

    final restCountryList =
        body.map((country) => RestCountriesCountry.fromMap(country)).toList();

    final countryList = restCountryList
        .map((country) => CountryMapper.restCountriesCountryToEntity(country))
        .toList();

    return countryList;
  }

  @override
  Future<Country> getCountryByName(String name) async {
    final uri = Uri.parse('${ConstantsApi.restCountries}/name/$name');
    final response = await http.get(uri);
    final body = json.decode(response.body)[0];

    final restCountriesCountry = RestCountriesCountry.fromMap(body);

    final country =
        CountryMapper.restCountriesCountryToEntity(restCountriesCountry);

    return country;
  }
}
