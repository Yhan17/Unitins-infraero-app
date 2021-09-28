import 'dart:convert';

import '../../domain/entities/departure_entity.dart';

class DepartureModel {
  final String iataCode;
  final DateTime at;
  const DepartureModel({
    required this.iataCode,
    required this.at,
  });

  Map<String, dynamic> toMap() {
    return {
      'iataCode': iataCode,
      'at': at.millisecondsSinceEpoch,
    };
  }

  factory DepartureModel.fromMap(Map<String, dynamic> map) {
    return DepartureModel(
      iataCode: map['iataCode'],
      at: DateTime.fromMillisecondsSinceEpoch(map['at']),
    );
  }

  factory DepartureModel.fromEntity(DepartureEntity entity) {
    return DepartureModel(
      iataCode: entity.iataCode,
      at: entity.at,
    );
  }

  DepartureEntity toEntity() => DepartureEntity(
        at: at,
        iataCode: iataCode,
      );

  String toJson() => json.encode(toMap());

  factory DepartureModel.fromJson(String source) =>
      DepartureModel.fromMap(json.decode(source));
}
