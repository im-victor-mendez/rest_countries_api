// To parse this JSON data, do
//
//     final restCountries = restCountriesFromMap(jsonString);

import 'dart:convert';

import 'capital_info.dart';
import 'car.dart';
import 'coat_of_arms.dart';
import 'continent.dart';
import 'currencies.dart';
import 'demonyms.dart';
import 'flags.dart';
import 'idd.dart';
import 'maps.dart';
import 'name.dart';
import 'postal_code.dart';
import 'region.dart';
import 'start_of_week.dart';
import 'status.dart';
import 'translation.dart';

List<RestCountriesCountry> restCountriesFromMap(String str) =>
    List<RestCountriesCountry>.from(
        json.decode(str).map((x) => RestCountriesCountry.fromMap(x)));

String restCountriesToMap(List<RestCountriesCountry> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class RestCountriesCountry {
  final RestCountriesName name;
  final List<String>? tld;
  final String cca2;
  final String? ccn3;
  final String cca3;
  final bool? independent;
  final RestCountriesStatus status;
  final bool unMember;
  final Currencies? currencies;
  final Idd idd;
  final List<String>? capital;
  final List<String> altSpellings;
  final RestCountriesRegion region;
  final String? subregion;
  final Map<String, String>? languages;
  final Map<String, Translation> translations;
  final List<double> latlng;
  final bool landlocked;
  final double area;
  final Demonyms? demonyms;
  final String flag;
  final Maps maps;
  final int population;
  final Car car;
  final List<String> timezones;
  final List<Continent> continents;
  final RestCountriesFlags flags;
  final CoatOfArms coatOfArms;
  final StartOfWeek startOfWeek;
  final CapitalInfo capitalInfo;
  final PostalCode? postalCode;
  final List<String>? borders;
  final String? cioc;
  final Map<String, double>? gini;
  final String? fifa;

  RestCountriesCountry({
    required this.name,
    this.tld,
    required this.cca2,
    this.ccn3,
    required this.cca3,
    this.independent,
    required this.status,
    required this.unMember,
    this.currencies,
    required this.idd,
    this.capital,
    required this.altSpellings,
    required this.region,
    this.subregion,
    this.languages,
    required this.translations,
    required this.latlng,
    required this.landlocked,
    required this.area,
    this.demonyms,
    required this.flag,
    required this.maps,
    required this.population,
    required this.car,
    required this.timezones,
    required this.continents,
    required this.flags,
    required this.coatOfArms,
    required this.startOfWeek,
    required this.capitalInfo,
    this.postalCode,
    this.borders,
    this.cioc,
    this.gini,
    this.fifa,
  });

  factory RestCountriesCountry.fromMap(Map<String, dynamic> json) =>
      RestCountriesCountry(
        name: RestCountriesName.fromMap(json["name"]),
        tld: json["tld"] == null
            ? []
            : List<String>.from(json["tld"]!.map((x) => x)),
        cca2: json["cca2"],
        ccn3: json["ccn3"],
        cca3: json["cca3"],
        independent: json["independent"],
        status: restCountriesStatusValues.map[json["status"]]!,
        unMember: json["unMember"],
        currencies: json["currencies"] == null
            ? null
            : Currencies.fromMap(json["currencies"]),
        idd: Idd.fromMap(json["idd"]),
        capital: json["capital"] == null
            ? []
            : List<String>.from(json["capital"]!.map((x) => x)),
        altSpellings: List<String>.from(json["altSpellings"].map((x) => x)),
        region: restCountriesRegionValues.map[json["region"]]!,
        subregion: json["subregion"],
        languages: json["languages"] == null
            ? null
            : Map.from(json["languages"]!)
                .map((k, v) => MapEntry<String, String>(k, v)),
        translations: Map.from(json["translations"]).map(
            (k, v) => MapEntry<String, Translation>(k, Translation.fromMap(v))),
        latlng: List<double>.from(json["latlng"].map((x) => x?.toDouble())),
        landlocked: json["landlocked"] ?? false,
        area: json["area"]?.toDouble(),
        demonyms: json["demonyms"] == null
            ? null
            : Demonyms.fromMap(json["demonyms"]),
        flag: json["flag"],
        maps: Maps.fromMap(json["maps"]),
        population: json["population"],
        car: Car.fromMap(json["car"]),
        timezones: List<String>.from(json["timezones"].map((x) => x)),
        continents: List<Continent>.from(
            json["continents"].map((x) => continentValues.map[x]!)),
        flags: RestCountriesFlags.fromMap(json["flags"]),
        coatOfArms: CoatOfArms.fromMap(json["coatOfArms"]),
        startOfWeek: startOfWeekValues.map[json["startOfWeek"]]!,
        capitalInfo: CapitalInfo.fromMap(json["capitalInfo"]),
        postalCode: json["postalCode"] == null
            ? null
            : PostalCode.fromMap(json["postalCode"]),
        borders: json["borders"] == null
            ? []
            : List<String>.from(json["borders"]!.map((x) => x)),
        cioc: json["cioc"],
        gini: json["gini"] == null
            ? null
            : Map.from(json["gini"]!)
                .map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
        fifa: json["fifa"],
      );

  Map<String, dynamic> toMap() => {
        "name": name.toMap(),
        "tld": tld == null ? [] : List<dynamic>.from(tld!.map((x) => x)),
        "cca2": cca2,
        "ccn3": ccn3,
        "cca3": cca3,
        "independent": independent,
        "status": restCountriesStatusValues.reverse[status],
        "unMember": unMember,
        "currencies": currencies?.toMap(),
        "idd": idd.toMap(),
        "capital":
            capital == null ? [] : List<dynamic>.from(capital!.map((x) => x)),
        "altSpellings": List<dynamic>.from(altSpellings.map((x) => x)),
        "region": restCountriesRegionValues.reverse[region],
        "subregion": subregion,
        "languages":
            Map.from(languages!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "translations": Map.from(translations)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toMap())),
        "latlng": List<dynamic>.from(latlng.map((x) => x)),
        "landlocked": landlocked,
        "area": area,
        "demonyms": demonyms?.toMap(),
        "flag": flag,
        "maps": maps.toMap(),
        "population": population,
        "car": car.toMap(),
        "timezones": List<dynamic>.from(timezones.map((x) => x)),
        "continents": List<dynamic>.from(
            continents.map((x) => continentValues.reverse[x])),
        "flags": flags.toMap(),
        "coatOfArms": coatOfArms.toMap(),
        "startOfWeek": startOfWeekValues.reverse[startOfWeek],
        "capitalInfo": capitalInfo.toMap(),
        "postalCode": postalCode?.toMap(),
        "borders":
            borders == null ? [] : List<dynamic>.from(borders!.map((x) => x)),
        "cioc": cioc,
        "gini": Map.from(gini!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "fifa": fifa,
      };
}
