// To parse this JSON data, do
//
//     final response = responseFromMap(jsonString);

class Aed {
  final String name;
  final String symbol;

  Aed({required this.name, required this.symbol});

  factory Aed.fromMap(Map<String, dynamic> json) =>
      Aed(name: json["name"], symbol: json["symbol"]);

  Map<String, dynamic> toMap() => {"name": name, "symbol": symbol};
}
