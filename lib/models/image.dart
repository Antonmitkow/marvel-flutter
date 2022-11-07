import 'dart:convert';

class ModelImage {
  final String path;
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
