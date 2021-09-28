import 'package:dartz/dartz.dart';

import '../core/failures/service_failures.dart';

abstract class CredentialsService {
  Future<Either<FlightsTokenFailure, Unit>> getFlightApiToken();
}
