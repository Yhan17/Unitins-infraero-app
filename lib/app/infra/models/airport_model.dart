import 'dart:convert';

import '../../domain/entities/airport_entity.dart';

class AirportModel {
  final String iata;
  final String icao;
  final String name;
  final String location;
  final String street;
  final String county;
  final double latitude;
  final double longitude;

  const AirportModel({
    required this.iata,
    required this.icao,
    required this.name,
    required this.location,
    required this.street,
    required this.county,
    required this.latitude,
    required this.longitude,
  });

  Map<String, dynamic> toMap() {
    return {
      'iata': iata,
      'icao': icao,
      'name': name,
      'location': location,
      'street': street,
      'county': county,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory AirportModel.fromMap(Map<String, dynamic> map) {
    return AirportModel(
      iata: map['iata'],
      icao: map['icao'],
      name: map['name'],
      location: map['location'],
      street: map['street'],
      county: map['county'],
      latitude: map['latitude'],
      longitude: map['longitude'],
    );
  }

  factory AirportModel.fromEntity(AirportEntity entity) {
    return AirportModel(
      county: entity.county,
      iata: entity.iata,
      icao: entity.icao,
      latitude: entity.latitude,
      location: entity.location,
      longitude: entity.longitude,
      name: entity.name,
      street: entity.street,
    );
  }

  AirportEntity toEntity() => AirportEntity(
        county: county,
        iata: iata,
        icao: icao,
        latitude: latitude,
        location: location,
        longitude: longitude,
        name: name,
        street: street,
      );

  String toJson() => json.encode(toMap());

  factory AirportModel.fromJson(String source) =>
      AirportModel.fromMap(json.decode(source));
}
