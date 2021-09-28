import 'package:dartz/dartz.dart';

import '../core/failures/service_failures.dart';
import '../entities/flights_entity.dart';

abstract class FlightService {
  Future<Either<FlightsFailure, List<FlightsEntity>>> getFlightsByDateAndIata(
    String originIata,
    String destinationIata,
    int passengers,
    DateTime departureDate,
  );
}
