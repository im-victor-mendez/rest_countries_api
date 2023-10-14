// To parse this JSON data, do
//
//     final country = countryFromMap(jsonString);

import 'acronym.dart';
import 'name.dart';
import 'other_acronym.dart';
import 'other_name.dart';

class RegionalBloc {
  final Acronym acronym;
  final ProjectName name;
  final List<OtherName>? otherNames;
  final List<OtherAcronym>? otherAcronyms;

  RegionalBloc({
    required this.acronym,
    required this.name,
    this.otherNames,
    this.otherAcronyms,
  });

  factory RegionalBloc.fromMap(Map<String, dynamic> json) => RegionalBloc(
        acronym: acronymValues.map[json["acronym"]]!,
        name: projectNameValues.map[json["name"]]!,
        otherNames: json["otherNames"] == null
            ? []
            : List<OtherName>.from(
                json["otherNames"]!.map((x) => otherNameValues.map[x]!)),
        otherAcronyms: json["otherAcronyms"] == null
            ? []
            : List<OtherAcronym>.from(
                json["otherAcronyms"]!.map((x) => otherAcronymValues.map[x]!)),
      );

  Map<String, dynamic> toMap() => {
        "acronym": acronymValues.reverse[acronym],
        "name": projectNameValues.reverse[name],
        "otherNames": otherNames == null
            ? []
            : List<dynamic>.from(
                otherNames!.map((x) => otherNameValues.reverse[x])),
        "otherAcronyms": otherAcronyms == null
            ? []
            : List<dynamic>.from(
                otherAcronyms!.map((x) => otherAcronymValues.reverse[x])),
      };
}
