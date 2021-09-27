import 'package:equatable/equatable.dart';

import 'aircraft_entity.dart';
import 'arrival_entity.dart';
import 'departure_entity.dart';

class SegmentEntity extends Equatable {
  final DepartureEntity departure;
  final ArrivalEntity arrival;
  final AircraftEntity aircraft;

  const SegmentEntity({
    required this.departure,
    required this.arrival,
    required this.aircraft,
  });
  @override
  List<Object?> get props => [
        departure,
        arrival,
        aircraft,
      ];
}
