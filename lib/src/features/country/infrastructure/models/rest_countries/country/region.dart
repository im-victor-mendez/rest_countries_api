// To parse this JSON data, do
//
//     final response = responseFromMap(jsonString);

// ignore_for_file: constant_identifier_names

import 'status.dart';

enum RestCountriesRegion { AFRICA, AMERICAS, ANTARCTIC, ASIA, EUROPE, OCEANIA }

final restCountriesRegionValues = RestCountriesEnumValues({
  "Africa": RestCountriesRegion.AFRICA,
  "Americas": RestCountriesRegion.AMERICAS,
  "Antarctic": RestCountriesRegion.ANTARCTIC,
  "Asia": RestCountriesRegion.ASIA,
  "Europe": RestCountriesRegion.EUROPE,
  "Oceania": RestCountriesRegion.OCEANIA
});
