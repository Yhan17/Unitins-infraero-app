import '../../../../domain/entities/flights_entity.dart';

class FlightDetailsArgs {
  final String originAirportName;
  final String destinyAirportName;
  final FlightsEntity flight;

  FlightDetailsArgs(this.originAirportName, this.destinyAirportName, this.flight);
}
