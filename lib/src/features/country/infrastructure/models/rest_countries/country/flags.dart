// To parse this JSON data, do
//
//     final response = responseFromMap(jsonString);

class RestCountriesFlags {
  final String png;
  final String svg;
  final String? alt;

  RestCountriesFlags({required this.png, required this.svg, this.alt});

  factory RestCountriesFlags.fromMap(Map<String, dynamic> json) =>
      RestCountriesFlags(png: json["png"], svg: json["svg"], alt: json["alt"]);

  Map<String, dynamic> toMap() => {"png": png, "svg": svg, "alt": alt};
}
