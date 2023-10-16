// To parse this JSON data, do
//
//     final projectCountry = projectCountryFromMap(jsonString);

import 'dart:convert';

import 'currency.dart';
import 'flags.dart';
import 'language.dart';
import 'region.dart';
import 'regional_bloc.dart';
import 'translations.dart';

List<ProjectCountry> projectCountryFromMap(String str) =>
    List<ProjectCountry>.from(
        json.decode(str).map((x) => ProjectCountry.fromMap(x)));

String projectCountryToMap(List<ProjectCountry> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class ProjectCountry {
  final String name;
  final List<String> topLevelDomain;
  final String alpha2Code;
  final String alpha3Code;
  final List<String> callingCodes;
  final String? capital;
  final List<String>? altSpellings;
  final String subregion;
  final ProjectRegion region;
  final int population;
  final List<double>? latlng;
  final String demonym;
  final double? area;
  final List<String> timezones;
  final List<String>? borders;
  final String nativeName;
  final String numericCode;
  final ProjectFlags flags;
  final List<Currency>? currencies;
  final List<Language> languages;
  final Translations translations;
  final String flag;
  final List<RegionalBloc>? regionalBlocs;
  final String? cioc;
  final bool independent;
  final double? gini;

  ProjectCountry({
    required this.name,
    required this.topLevelDomain,
    required this.alpha2Code,
    required this.alpha3Code,
    required this.callingCodes,
    this.capital,
    this.altSpellings,
    required this.subregion,
    required this.region,
    required this.population,
    this.latlng,
    required this.demonym,
    this.area,
    required this.timezones,
    this.borders,
    required this.nativeName,
    required this.numericCode,
    required this.flags,
    this.currencies,
    required this.languages,
    required this.translations,
    required this.flag,
    this.regionalBlocs,
    this.cioc,
    required this.independent,
    this.gini,
  });

  factory ProjectCountry.fromMap(Map<String, dynamic> json) => ProjectCountry(
        name: json["name"],
        topLevelDomain: List<String>.from(json["topLevelDomain"].map((x) => x)),
        alpha2Code: json["alpha2Code"],
        alpha3Code: json["alpha3Code"],
        callingCodes: List<String>.from(json["callingCodes"].map((x) => x)),
        capital: json["capital"],
        altSpellings: json["altSpellings"] == null
            ? []
            : List<String>.from(json["altSpellings"]!.map((x) => x)),
        subregion: json["subregion"],
        region: projectRegionValues.map[json["region"]]!,
        population: json["population"],
        latlng: json["latlng"] == null
            ? []
            : List<double>.from(json["latlng"]!.map((x) => x?.toDouble())),
        demonym: json["demonym"],
        area: json["area"]?.toDouble(),
        timezones: List<String>.from(json["timezones"].map((x) => x)),
        borders: json["borders"] == null
            ? []
            : List<String>.from(json["borders"]!.map((x) => x)),
        nativeName: json["nativeName"],
        numericCode: json["numericCode"],
        flags: ProjectFlags.fromMap(json["flags"]),
        currencies: json["currencies"] == null
            ? []
            : List<Currency>.from(
                json["currencies"]!.map((x) => Currency.fromMap(x))),
        languages: List<Language>.from(
            json["languages"].map((x) => Language.fromMap(x))),
        translations: Translations.fromMap(json["translations"]),
        flag: json["flag"],
        regionalBlocs: json["regionalBlocs"] == null
            ? []
            : List<RegionalBloc>.from(
                json["regionalBlocs"]!.map((x) => RegionalBloc.fromMap(x))),
        cioc: json["cioc"],
        independent: json["independent"],
        gini: json["gini"]?.toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "topLevelDomain": List<dynamic>.from(topLevelDomain.map((x) => x)),
        "alpha2Code": alpha2Code,
        "alpha3Code": alpha3Code,
        "callingCodes": List<dynamic>.from(callingCodes.map((x) => x)),
        "capital": capital,
        "altSpellings": altSpellings == null
            ? []
            : List<dynamic>.from(altSpellings!.map((x) => x)),
        "subregion": subregion,
        "region": projectRegionValues.reverse[region],
        "population": population,
        "latlng":
            latlng == null ? [] : List<dynamic>.from(latlng!.map((x) => x)),
        "demonym": demonym,
        "area": area,
        "timezones": List<dynamic>.from(timezones.map((x) => x)),
        "borders":
            borders == null ? [] : List<dynamic>.from(borders!.map((x) => x)),
        "nativeName": nativeName,
        "numericCode": numericCode,
        "flags": flags.toMap(),
        "currencies": currencies == null
            ? []
            : List<dynamic>.from(currencies!.map((x) => x.toMap())),
        "languages": List<dynamic>.from(languages.map((x) => x.toMap())),
        "translations": translations.toMap(),
        "flag": flag,
        "regionalBlocs": regionalBlocs == null
            ? []
            : List<dynamic>.from(regionalBlocs!.map((x) => x.toMap())),
        "cioc": cioc,
        "independent": independent,
        "gini": gini,
      };

  ProjectCountry.empty()
      : name = '',
        topLevelDomain = [],
        alpha2Code = '',
        alpha3Code = '',
        callingCodes = [],
        capital = '',
        altSpellings = [],
        subregion = '',
        region = ProjectRegion.AFRICA,
        population = 0,
        latlng = [],
        demonym = '',
        area = 0,
        timezones = [],
        borders = [],
        nativeName = '',
        numericCode = '',
        flags = ProjectFlags(svg: '', png: ''),
        currencies = [],
        languages = [],
        translations = Translations.empty(),
        flag = '',
        regionalBlocs = [],
        cioc = '',
        independent = false,
        gini = 0;
}
