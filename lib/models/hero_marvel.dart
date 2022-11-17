import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:flutter_labs/models/image.dart';

@HiveType(typeId: 1)
class HeroMarvel {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final ModelImage image;

  const HeroMarvel({
    required this.id,
    required this.name,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});

    result.addAll({'thumbnail': image.toMap()});

    return result;
  }

  factory HeroMarvel.fromMap(Map<String, dynamic> map) {
    return HeroMarvel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      image: ModelImage.fromMap(map['thumbnail']),
    );
  }

  String toJson() => json.encode(toMap());

  factory HeroMarvel.fromJson(String source) =>
      HeroMarvel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'HeroMarvel(id: $id, name: $name,  thumbnail: $image)';
  }
}

class HeroMarvelAdapter extends TypeAdapter<HeroMarvel> {
  @override
  final typeId = 1;

  @override
  HeroMarvel read(BinaryReader reader) {
    final id = reader.readInt();
    final name = reader.readString();
    final extension = reader.readString();
    final path = reader.readString();
    return HeroMarvel(
        id: id,
        name: name,
        image: ModelImage(path: path, extension: extension));
  }

  @override
  void write(BinaryWriter writer, HeroMarvel obj) {
    writer.writeInt(obj.id);
    writer.writeString(obj.name);
    writer.writeString(obj.image.extension);
    writer.writeString(obj.image.path);
  }
}
