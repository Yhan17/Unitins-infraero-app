import 'dart:convert';

import '../../domain/entities/segment_entity.dart';

import 'aircraft_model.dart';
import 'arrival_model.dart';
import 'departure_model.dart';

class SegmentModel {
  final DepartureModel departure;
  final ArrivalModel arrival;
  final AircraftModel aircraft;

  const SegmentModel({
    required this.departure,
    required this.arrival,
    required this.aircraft,
  });

  Map<String, dynamic> toMap() {
    return {
      'departure': departure.toMap(),
      'arrival': arrival.toMap(),
      'aircraft': aircraft.toMap(),
    };
  }

  factory SegmentModel.fromMap(Map<String, dynamic> map) {
    return SegmentModel(
      departure: DepartureModel.fromMap(map['departure']),
      arrival: ArrivalModel.fromMap(map['arrival']),
      aircraft: AircraftModel.fromMap(map['aircraft']),
    );
  }

  factory SegmentModel.fromEntity(SegmentEntity entity) {
    return SegmentModel(
      aircraft: AircraftModel.fromEntity(entity.aircraft),
      arrival: ArrivalModel.fromEntity(entity.arrival),
      departure: DepartureModel.fromEntity(entity.departure),
    );
  }

  SegmentEntity toEntity() => SegmentEntity(
        aircraft: aircraft.toEntity(),
        arrival: arrival.toEntity(),
        departure: departure.toEntity(),
      );

  String toJson() => json.encode(toMap());

  factory SegmentModel.fromJson(String source) =>
      SegmentModel.fromMap(json.decode(source));
}
