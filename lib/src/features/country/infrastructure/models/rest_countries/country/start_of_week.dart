// To parse this JSON data, do
//
//     final response = responseFromMap(jsonString);

// ignore_for_file: constant_identifier_names

import 'status.dart';

enum StartOfWeek { MONDAY, SATURDAY, SUNDAY }

final startOfWeekValues = EnumValues({
  "monday": StartOfWeek.MONDAY,
  "saturday": StartOfWeek.SATURDAY,
  "sunday": StartOfWeek.SUNDAY
});
