// To parse this JSON data, do
//
//     final response = responseFromMap(jsonString);

// ignore_for_file: constant_identifier_names

enum RestCountriesStatus { OFFICIALLY_ASSIGNED, USER_ASSIGNED }

final restCountriesStatusValues = RestCountriesEnumValues({
  "officially-assigned": RestCountriesStatus.OFFICIALLY_ASSIGNED,
  "user-assigned": RestCountriesStatus.USER_ASSIGNED
});

class RestCountriesEnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  RestCountriesEnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
