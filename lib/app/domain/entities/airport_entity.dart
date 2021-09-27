import 'package:equatable/equatable.dart';

import 'flights_entity.dart';

class AirportEntity extends Equatable {
  final String iata;
  final String icao;
  final String name;
  final String location;
  final String street;
  final String county;
  final double latitude;
  final double longitude;
  final List<FlightsEntity>? flights;
  const AirportEntity(
      {required this.iata,
      required this.icao,
      required this.name,
      required this.location,
      required this.street,
      required this.county,
      required this.latitude,
      required this.longitude,
      this.flights});

  @override
  List<Object?> get props => [
        iata,
        icao,
        name,
        location,
        street,
        county,
        latitude,
        longitude,
        flights,
      ];
}
