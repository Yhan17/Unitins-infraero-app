import 'dart:convert';

import '../../domain/entities/arrival_entity.dart';

class ArrivalModel {
  final String iataCode;
  final String terminal;
  final DateTime at;
  const ArrivalModel({
    required this.iataCode,
    required this.terminal,
    required this.at,
  });

  Map<String, dynamic> toMap() {
    return {
      'iataCode': iataCode,
      'terminal': terminal,
      'at': at.millisecondsSinceEpoch,
    };
  }

  factory ArrivalModel.fromMap(Map<String, dynamic> map) {
    return ArrivalModel(
      iataCode: map['iataCode'],
      terminal: map['terminal'],
      at: DateTime.fromMillisecondsSinceEpoch(map['at']),
    );
  }

  factory ArrivalModel.fromEntity(ArrivalEntity entity) {
    return ArrivalModel(
      iataCode: entity.iataCode,
      terminal: entity.terminal,
      at: entity.at,
    );
  }

  ArrivalEntity toEntity() => ArrivalEntity(
        at: at,
        iataCode: iataCode,
        terminal: terminal,
      );

  String toJson() => json.encode(toMap());

  factory ArrivalModel.fromJson(String source) =>
      ArrivalModel.fromMap(json.decode(source));
}
