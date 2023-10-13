// To parse this JSON data, do
//
//     final response = responseFromMap(jsonString);

class Bam {
  final String name;

  Bam({required this.name});

  factory Bam.fromMap(Map<String, dynamic> json) => Bam(name: json["name"]);

  Map<String, dynamic> toMap() => {"name": name};
}
