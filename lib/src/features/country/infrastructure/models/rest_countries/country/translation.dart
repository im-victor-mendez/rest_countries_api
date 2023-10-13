// To parse this JSON data, do
//
//     final response = responseFromMap(jsonString);

class Translation {
  final String official;
  final String common;

  Translation({required this.official, required this.common});

  factory Translation.fromMap(Map<String, dynamic> json) =>
      Translation(official: json["official"], common: json["common"]);

  Map<String, dynamic> toMap() => {"official": official, "common": common};
}
