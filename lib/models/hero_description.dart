import 'dart:convert';

class HeroDescription {
  final int id;
  final String description;
  HeroDescription({
    required this.id,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'description': description});

    return result;
  }

  factory HeroDescription.fromMap(Map<String, dynamic> map) {
    return HeroDescription(
      id: map['id']?.toInt() ?? 0,
      description: map['description'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory HeroDescription.fromJson(String source) =>
      HeroDescription.fromMap(json.decode(source));

  @override
  String toString() => 'HeroDescription(id: $id, description: $description)';
}
