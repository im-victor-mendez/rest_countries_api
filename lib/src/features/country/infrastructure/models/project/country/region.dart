// To parse this JSON data, do
//
//     final country = countryFromMap(jsonString);

import 'enum_values.dart';

enum ProjectRegion {
  AFRICA,
  AMERICAS,
  ANTARCTIC,
  ANTARCTIC_OCEAN,
  ASIA,
  EUROPE,
  OCEANIA,
  POLAR
}

final projectRegionValues = EnumValues({
  "Africa": ProjectRegion.AFRICA,
  "Americas": ProjectRegion.AMERICAS,
  "Antarctic": ProjectRegion.ANTARCTIC,
  "Antarctic Ocean": ProjectRegion.ANTARCTIC_OCEAN,
  "Asia": ProjectRegion.ASIA,
  "Europe": ProjectRegion.EUROPE,
  "Oceania": ProjectRegion.OCEANIA,
  "Polar": ProjectRegion.POLAR
});
