// To parse this JSON data, do
//
//     final country = countryFromMap(jsonString);

class Language {
  final String? iso6391;
  final String iso6392;
  final String name;
  final String? nativeName;

  Language({
    this.iso6391,
    required this.iso6392,
    required this.name,
    this.nativeName,
  });

  factory Language.fromMap(Map<String, dynamic> json) => Language(
        iso6391: json["iso639_1"],
        iso6392: json["iso639_2"],
        name: json["name"],
        nativeName: json["nativeName"],
      );

  Map<String, dynamic> toMap() => {
        "iso639_1": iso6391,
        "iso639_2": iso6392,
        "name": name,
        "nativeName": nativeName,
      };
}
