import 'dart:convert';


class PixKeyModel {
  final int id;
  final PixKeyType type;
  final String data;

  PixKeyModel({
    required this.id,
    required this.type,
    required this.data,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type.name,
      'data': data,
    };
  }

  factory PixKeyModel.fromMap(Map<String, dynamic> map) {
    return PixKeyModel(
      id: map['id']!,
      type: PixKeyType.values.firstWhere((PixKeyType element) => element.name == map['type'] as String),
      data: map['data'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PixKeyModel.fromJson(String source) => PixKeyModel.fromMap(json.decode(source));
}

enum PixKeyType { PHONE, EVP, TAXID, EMAIL }