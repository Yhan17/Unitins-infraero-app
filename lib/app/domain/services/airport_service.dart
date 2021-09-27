import 'package:dartz/dartz.dart';

import '../core/failures/service_failures.dart';
import '../entities/airport_entity.dart';

abstract class AirportService {
  Future<Either<AirportFailures, AirportEntity>> getAirportInfo(String iata);
}
