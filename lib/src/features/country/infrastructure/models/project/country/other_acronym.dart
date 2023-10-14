// To parse this JSON data, do
//
//     final country = countryFromMap(jsonString);

import 'enum_values.dart';

enum OtherAcronym { EAEU, SICA, UNASUL, UNASUR, UZAN }

final otherAcronymValues = EnumValues({
  "EAEU": OtherAcronym.EAEU,
  "SICA": OtherAcronym.SICA,
  "UNASUL": OtherAcronym.UNASUL,
  "UNASUR": OtherAcronym.UNASUR,
  "UZAN": OtherAcronym.UZAN
});
