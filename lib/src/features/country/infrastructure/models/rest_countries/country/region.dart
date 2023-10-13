// To parse this JSON data, do
//
//     final response = responseFromMap(jsonString);

// ignore_for_file: constant_identifier_names

import 'status.dart';

enum Region { AFRICA, AMERICAS, ANTARCTIC, ASIA, EUROPE, OCEANIA }

final regionValues = EnumValues({
  "Africa": Region.AFRICA,
  "Americas": Region.AMERICAS,
  "Antarctic": Region.ANTARCTIC,
  "Asia": Region.ASIA,
  "Europe": Region.EUROPE,
  "Oceania": Region.OCEANIA
});
