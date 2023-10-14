// To parse this JSON data, do
//
//     final country = countryFromMap(jsonString);

class Currency {
  final String code;
  final String name;
  final String symbol;

  Currency({required this.code, required this.name, required this.symbol});

  factory Currency.fromMap(Map<String, dynamic> json) =>
      Currency(code: json["code"], name: json["name"], symbol: json["symbol"]);

  Map<String, dynamic> toMap() =>
      {"code": code, "name": name, "symbol": symbol};
}
