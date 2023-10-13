// To parse this JSON data, do
//
//     final response = responseFromMap(jsonString);

class CoatOfArms {
  final String? png;
  final String? svg;

  CoatOfArms({this.png, this.svg});

  factory CoatOfArms.fromMap(Map<String, dynamic> json) =>
      CoatOfArms(png: json["png"], svg: json["svg"]);

  Map<String, dynamic> toMap() => {"png": png, "svg": svg};
}
