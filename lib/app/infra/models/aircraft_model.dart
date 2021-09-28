import 'dart:convert';

import '../../domain/entities/aircraft_entity.dart';

class AircraftModel {
  final String code;

  const AircraftModel({
    required this.code,
  });

  Map<String, dynamic> toMap() {
    return {
      'code': code,
    };
  }

  factory AircraftModel.fromMap(Map<String, dynamic> map) {
    return AircraftModel(
      code: map['code'],
    );
  }

  factory AircraftModel.fromEntity(AircraftEntity entity) {
    return AircraftModel(code: entity.code);
  }

  AircraftEntity toEntity() => AircraftEntity(code: code);

  String toJson() => json.encode(toMap());

  factory AircraftModel.fromJson(String source) =>
      AircraftModel.fromMap(json.decode(source));
}
