import 'package:dartz/dartz.dart';

import '../core/failures/service_failures.dart';

abstract class FlightService {
  Future<Either<FlightsTokenFailure, Unit>> getFlightApiToken();

  Future<Either<FlightsFailure, Unit>> getFlightsByDateAndIata(
    String originIata,
    String destinationIata,
    int passengers,
    DateTime departureDate,
  );
}
