// To parse this JSON data, do
//
//     final response = responseFromMap(jsonString);

import 'side.dart';

class Car {
  final List<String>? signs;
  final Side side;

  Car({this.signs, required this.side});

  factory Car.fromMap(Map<String, dynamic> json) => Car(
        signs: json["signs"] == null
            ? []
            : List<String>.from(json["signs"]!.map((x) => x)),
        side: sideValues.map[json["side"]]!,
      );

  Map<String, dynamic> toMap() => {
        "signs": signs == null ? [] : List<dynamic>.from(signs!.map((x) => x)),
        "side": sideValues.reverse[side],
      };
}
