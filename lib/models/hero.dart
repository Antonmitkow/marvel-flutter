import 'dart:convert';

import 'package:flutter_labs/models/image.dart';

class HeroMarvel {
  final int id;
  final String name;
  final String description;
  final ModelImage image;
  const HeroMarvel({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'description': description});
    result.addAll({'thumbnail': image.toMap()});

    return result;
  }

  factory HeroMarvel.fromMap(Map<String, dynamic> map) {
    return HeroMarvel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      image: ModelImage.fromMap(map['thumbnail']),
    );
  }

  String toJson() => json.encode(toMap());

  factory HeroMarvel.fromJson(String source) =>
      HeroMarvel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'HeroMarvel(id: $id, name: $name, description: $description, thumbnail: $image)';
  }
}
