// To parse this JSON data, do
//
//     final response = responseFromMap(jsonString);

class Flags {
  final String png;
  final String svg;
  final String? alt;

  Flags({required this.png, required this.svg, this.alt});

  factory Flags.fromMap(Map<String, dynamic> json) =>
      Flags(png: json["png"], svg: json["svg"], alt: json["alt"]);

  Map<String, dynamic> toMap() => {"png": png, "svg": svg, "alt": alt};
}
