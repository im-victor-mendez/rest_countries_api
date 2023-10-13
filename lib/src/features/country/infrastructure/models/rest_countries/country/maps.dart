// To parse this JSON data, do
//
//     final response = responseFromMap(jsonString);

class Maps {
  final String googleMaps;
  final String openStreetMaps;

  Maps({required this.googleMaps, required this.openStreetMaps});

  factory Maps.fromMap(Map<String, dynamic> json) => Maps(
      googleMaps: json["googleMaps"], openStreetMaps: json["openStreetMaps"]);

  Map<String, dynamic> toMap() =>
      {"googleMaps": googleMaps, "openStreetMaps": openStreetMaps};
}
