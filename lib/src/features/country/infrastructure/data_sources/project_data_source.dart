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

    final projectCountryList = data
        .map((country) =>
            ProjectCountry.fromMap(country as Map<String, dynamic>))
        .toList();
    final countryList = projectCountryList
        .map((country) => CountryMapper.projectCountryToEntity(country))
        .toList();

    return countryList;
  }

  @override
  Future<Country> getCountryByCode(String code) async {
    final response = await rootBundle.loadString('project/data.json');
    final data = json.decode(response) as List;

    final projectCountryList = data
        .map((country) =>
            ProjectCountry.fromMap(country as Map<String, dynamic>))
        .toList();

    final ProjectCountry projectCountry = projectCountryList.firstWhere(
      (entry) =>
          entry.alpha2Code == code ||
          entry.alpha3Code == code ||
          entry.altSpellings!.contains(code),
      orElse: () => ProjectCountry.empty(),
    );

    final country = CountryMapper.projectCountryToEntity(projectCountry);

    return country;
  }

  @override
  Future<Country> getCountryByName(String name) async =>
      await getAllCountries().then((value) => value.firstWhere(
            (country) => country.name.toLowerCase() == name.toLowerCase(),
            // TODO: Change to Country Error Not Founded
            orElse: () => Country.empty(),
          ));
}
