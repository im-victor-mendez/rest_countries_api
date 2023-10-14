// To parse this JSON data, do
//
//     final country = countryFromMap(jsonString);

class ProjectFlags {
  final String svg;
  final String png;

  ProjectFlags({required this.svg, required this.png});

  factory ProjectFlags.fromMap(Map<String, dynamic> json) =>
      ProjectFlags(svg: json["svg"], png: json["png"]);

  Map<String, dynamic> toMap() => {"svg": svg, "png": png};
}
