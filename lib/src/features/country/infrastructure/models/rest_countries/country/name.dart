// To parse this JSON data, do
//
//     final response = responseFromMap(jsonString);

import 'translation.dart';

class Name {
  final String common;
  final String official;
  final Map<String, Translation>? nativeName;

  Name({required this.common, required this.official, this.nativeName});

  factory Name.fromMap(Map<String, dynamic> json) => Name(
        common: json["common"],
        official: json["official"],
        nativeName: Map.from(json["nativeName"]!).map(
            (k, v) => MapEntry<String, Translation>(k, Translation.fromMap(v))),
      );

  Map<String, dynamic> toMap() => {
        "common": common,
        "official": official,
        "nativeName": Map.from(nativeName!)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toMap())),
      };
}
