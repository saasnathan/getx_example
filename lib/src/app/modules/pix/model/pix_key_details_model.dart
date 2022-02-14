import 'dart:convert';


class PixKeyDetailsModel {
  final DateTime createdAt;
  final PixKeyStatus status;

  PixKeyDetailsModel({
    required this.createdAt,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'createdAt': createdAt.millisecondsSinceEpoch,
      'status': status.name,
    };
  }

  factory PixKeyDetailsModel.fromMap(Map<String, dynamic> map) {
    return PixKeyDetailsModel(
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
      status: PixKeyStatus.values.firstWhere((PixKeyStatus element) => element.name == map['status'] as String),
    );
  }

  String toJson() => json.encode(toMap());

  factory PixKeyDetailsModel.fromJson(String source) => PixKeyDetailsModel.fromMap(json.decode(source));
}

enum PixKeyStatus { ACTIVE, PEDDING }