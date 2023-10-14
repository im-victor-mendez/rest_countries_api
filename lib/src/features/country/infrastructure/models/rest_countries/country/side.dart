// To parse this JSON data, do
//
//     final response = responseFromMap(jsonString);

// ignore_for_file: constant_identifier_names

import 'status.dart';

enum Side { LEFT, RIGHT }

final sideValues =
    RestCountriesEnumValues({"left": Side.LEFT, "right": Side.RIGHT});
