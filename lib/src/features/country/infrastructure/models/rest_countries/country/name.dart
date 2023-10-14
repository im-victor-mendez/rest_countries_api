// To parse this JSON data, do
//
//     final response = responseFromMap(jsonString);

import 'translation.dart';

class RestCountriesName {
  final String common;
  final String official;
  final Map<String, Translation>? nativeName;

  RestCountriesName({
    required this.common,
    required this.official,
    this.nativeName,
  });

  factory RestCountriesName.fromMap(Map<String, dynamic> json) =>
      RestCountriesName(
        common: json["common"],
        official: json["official"],
        nativeName: json["nativeName"] == null
            ? <String, Translation>{}
            : Map.from(json["nativeName"]!).map((k, v) =>
                MapEntry<String, Translation>(k, Translation.fromMap(v))),
      );

  Map<String, dynamic> toMap() => {
        "common": common,
        "official": official,
        "nativeName": Map.from(nativeName!)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toMap())),
      };
}
