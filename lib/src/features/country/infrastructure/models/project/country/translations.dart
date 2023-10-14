// To parse this JSON data, do
//
//     final country = countryFromMap(jsonString);

class Translations {
  final String br;
  final String pt;
  final String nl;
  final String hr;
  final String? fa;
  final String de;
  final String es;
  final String fr;
  final String ja;
  final String it;
  final String hu;

  Translations({
    required this.br,
    required this.pt,
    required this.nl,
    required this.hr,
    this.fa,
    required this.de,
    required this.es,
    required this.fr,
    required this.ja,
    required this.it,
    required this.hu,
  });

  factory Translations.fromMap(Map<String, dynamic> json) => Translations(
        br: json["br"],
        pt: json["pt"],
        nl: json["nl"],
        hr: json["hr"],
        fa: json["fa"],
        de: json["de"],
        es: json["es"],
        fr: json["fr"],
        ja: json["ja"],
        it: json["it"],
        hu: json["hu"],
      );

  Map<String, dynamic> toMap() => {
        "br": br,
        "pt": pt,
        "nl": nl,
        "hr": hr,
        "fa": fa,
        "de": de,
        "es": es,
        "fr": fr,
        "ja": ja,
        "it": it,
        "hu": hu,
      };
}
