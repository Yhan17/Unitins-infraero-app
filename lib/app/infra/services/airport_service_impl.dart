import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../domain/core/failures/service_failures.dart';
import '../../domain/entities/airport_entity.dart';
import '../../domain/services/airport_service.dart';
import '../core/http/airport_client.dart';
import '../models/airport_model.dart';

class AirportServiceImpl extends AirportService {
  final AirportHttpClient client;

  AirportServiceImpl(this.client);
  @override
  Future<Either<AirportFailures, AirportEntity>> getAirportInfo(
    String iata,
  ) async {
    try {
      final response = await client.get(
        'airport',
        queryParameters: {'iata': iata},
      );

      final airport = AirportModel.fromMap(response.data).toEntity();

      if (response.data['error'] != null) {
        return left(AirportFailures.unknownAirport);
      }

      return right(airport);
    } on DioError catch (e) {
      switch (e.response!.statusCode) {
        case 401:
          return left(AirportFailures.expiredToken);
        default:
          return left(AirportFailures.serverError);
      }
    }
  }
}
