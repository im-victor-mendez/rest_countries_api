// To parse this JSON data, do
//
//     final response = responseFromMap(jsonString);

import 'eng.dart';

class Demonyms {
  final Eng eng;
  final Eng? fra;

  Demonyms({required this.eng, this.fra});

  factory Demonyms.fromMap(Map<String, dynamic> json) => Demonyms(
        eng: Eng.fromMap(json["eng"]),
        fra: json["fra"] == null ? null : Eng.fromMap(json["fra"]),
      );

  Map<String, dynamic> toMap() => {"eng": eng.toMap(), "fra": fra?.toMap()};
}
