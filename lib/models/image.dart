import 'dart:convert';
import 'package:hive/hive.dart';

@HiveType(typeId: 2)
class ModelImage {
  @HiveField(0)
  final String path;

  @HiveField(1)
  final String extension;
  const ModelImage({
    required this.path,
    required this.extension,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'path': path});
    result.addAll({'extension': extension});

    return result;
  }

  factory ModelImage.fromMap(Map<String, dynamic> map) {
    return ModelImage(
      path: map['path'] ?? '',
      extension: map['extension'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelImage.fromJson(String source) =>
      ModelImage.fromMap(json.decode(source));

  @override
  String toString() => 'ModelImage(path: $path, extension: $extension)';
}

class ModelImageAdapter extends TypeAdapter<ModelImage> {
  @override
  final typeId = 2;

  @override
  ModelImage read(BinaryReader reader) {
    final path = reader.readString();
    final extension = reader.readString();
    return ModelImage(path: path, extension: extension);
  }

  @override
  void write(BinaryWriter writer, ModelImage obj) {
    writer.writeString(obj.path);
    writer.writeString(obj.extension);
  }
}
