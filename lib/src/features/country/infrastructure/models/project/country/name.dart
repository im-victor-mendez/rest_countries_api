// To parse this JSON data, do
//
//     final country = countryFromMap(jsonString);

import 'enum_values.dart';

enum ProjectName {
  AFRICAN_UNION,
  ARAB_LEAGUE,
  ASSOCIATION_OF_SOUTHEAST_ASIAN_NATIONS,
  CARIBBEAN_COMMUNITY,
  CENTRAL_AMERICAN_INTEGRATION_SYSTEM,
  CENTRAL_EUROPEAN_FREE_TRADE_AGREEMENT,
  EURASIAN_ECONOMIC_UNION,
  EUROPEAN_FREE_TRADE_ASSOCIATION,
  EUROPEAN_UNION,
  NORTH_AMERICAN_FREE_TRADE_AGREEMENT,
  PACIFIC_ALLIANCE,
  SOUTH_ASIAN_ASSOCIATION_FOR_REGIONAL_COOPERATION,
  UNION_OF_SOUTH_AMERICAN_NATIONS
}

final projectNameValues = EnumValues({
  "African Union": ProjectName.AFRICAN_UNION,
  "Arab League": ProjectName.ARAB_LEAGUE,
  "Association of Southeast Asian Nations":
      ProjectName.ASSOCIATION_OF_SOUTHEAST_ASIAN_NATIONS,
  "Caribbean Community": ProjectName.CARIBBEAN_COMMUNITY,
  "Central American Integration System":
      ProjectName.CENTRAL_AMERICAN_INTEGRATION_SYSTEM,
  "Central European Free Trade Agreement":
      ProjectName.CENTRAL_EUROPEAN_FREE_TRADE_AGREEMENT,
  "Eurasian Economic Union": ProjectName.EURASIAN_ECONOMIC_UNION,
  "European Free Trade Association":
      ProjectName.EUROPEAN_FREE_TRADE_ASSOCIATION,
  "European Union": ProjectName.EUROPEAN_UNION,
  "North American Free Trade Agreement":
      ProjectName.NORTH_AMERICAN_FREE_TRADE_AGREEMENT,
  "Pacific Alliance": ProjectName.PACIFIC_ALLIANCE,
  "South Asian Association for Regional Cooperation":
      ProjectName.SOUTH_ASIAN_ASSOCIATION_FOR_REGIONAL_COOPERATION,
  "Union of South American Nations": ProjectName.UNION_OF_SOUTH_AMERICAN_NATIONS
});
