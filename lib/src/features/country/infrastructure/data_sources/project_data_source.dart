import 'dart:convert';

import 'package:flutter/services.dart';

import '../../domain/data_sources/country_data_source.dart';
import '../../domain/entities/country.dart';
import '../mappers/country_mapper.dart';
import '../models/project/country/country_models.dart';

class ProjectDataSource extends CountryDataSource {
  @override
  Future<List<Country>> getAllCountries() async {
    final response = await rootBundle.loadString('project/data.json');
    final data = json.decode(response) as List;

    final restCountryList = data
        .map((country) =>
            ProjectCountry.fromMap(country as Map<String, dynamic>))
        .toList();
    final countryList = restCountryList
        .map((country) => CountryMapper.projectCountryToEntity(country))
        .toList();

    return countryList;
  }

  @override
  Future<Country> getCountryByName(String name) => throw UnimplementedError();
}
