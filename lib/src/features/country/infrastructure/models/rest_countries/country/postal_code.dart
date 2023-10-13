// To parse this JSON data, do
//
//     final response = responseFromMap(jsonString);

class PostalCode {
  final String format;
  final String? regex;

  PostalCode({required this.format, this.regex});

  factory PostalCode.fromMap(Map<String, dynamic> json) =>
      PostalCode(format: json["format"], regex: json["regex"]);

  Map<String, dynamic> toMap() => {"format": format, "regex": regex};
}
