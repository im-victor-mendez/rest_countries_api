// To parse this JSON data, do
//
//     final response = responseFromMap(jsonString);

class Idd {
  final String? root;
  final List<String>? suffixes;

  Idd({this.root, this.suffixes});

  factory Idd.fromMap(Map<String, dynamic> json) => Idd(
        root: json["root"],
        suffixes: json["suffixes"] == null
            ? []
            : List<String>.from(json["suffixes"]!.map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "root": root,
        "suffixes":
            suffixes == null ? [] : List<dynamic>.from(suffixes!.map((x) => x)),
      };
}
