// To parse this JSON data, do
//
//     final response = responseFromMap(jsonString);

class CapitalInfo {
  final List<double>? latlng;

  CapitalInfo({this.latlng});

  factory CapitalInfo.fromMap(Map<String, dynamic> json) => CapitalInfo(
        latlng: json["latlng"] == null
            ? []
            : List<double>.from(json["latlng"]!.map((x) => x?.toDouble())),
      );

  Map<String, dynamic> toMap() => {
        "latlng":
            latlng == null ? [] : List<dynamic>.from(latlng!.map((x) => x)),
      };
}
