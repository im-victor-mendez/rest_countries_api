// To parse this JSON data, do
//
//     final response = responseFromMap(jsonString);

class Eng {
  final String f;
  final String m;

  Eng({required this.f, required this.m});

  factory Eng.fromMap(Map<String, dynamic> json) =>
      Eng(f: json["f"], m: json["m"]);

  Map<String, dynamic> toMap() => {"f": f, "m": m};
}
