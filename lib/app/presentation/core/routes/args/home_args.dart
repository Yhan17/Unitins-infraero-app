import '../../../../domain/entities/airport_entity.dart';
import '../../../../domain/entities/flights_entity.dart';

class HomeArgs {
  final AirportEntity destiny;
  final AirportEntity origin;
  final List<FlightsEntity> flights;

  HomeArgs(
    this.destiny,
    this.origin,
    this.flights,
  );
}
