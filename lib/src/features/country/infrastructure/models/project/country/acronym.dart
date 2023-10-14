// To parse this JSON data, do
//
//     final country = countryFromMap(jsonString);

import 'enum_values.dart';

enum Acronym {
  AL,
  ASEAN,
  AU,
  CAIS,
  CARICOM,
  CEFTA,
  EEU,
  EFTA,
  EU,
  NAFTA,
  PA,
  SAARC,
  USAN
}

final acronymValues = EnumValues({
  "AL": Acronym.AL,
  "ASEAN": Acronym.ASEAN,
  "AU": Acronym.AU,
  "CAIS": Acronym.CAIS,
  "CARICOM": Acronym.CARICOM,
  "CEFTA": Acronym.CEFTA,
  "EEU": Acronym.EEU,
  "EFTA": Acronym.EFTA,
  "EU": Acronym.EU,
  "NAFTA": Acronym.NAFTA,
  "PA": Acronym.PA,
  "SAARC": Acronym.SAARC,
  "USAN": Acronym.USAN
});
