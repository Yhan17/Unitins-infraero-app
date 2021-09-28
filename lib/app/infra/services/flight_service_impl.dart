import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:infraero/app/infra/models/flights_model.dart';
import 'package:intl/intl.dart';

import '../../domain/core/failures/service_failures.dart';
import '../../domain/entities/flights_entity.dart';
import '../../domain/services/flight_service.dart';
import '../core/http/flight_client.dart';

class FlightServiceImpl extends FlightService {
  final FlightHttpClient client;

  FlightServiceImpl(this.client);
  @override
  Future<Either<FlightsFailure, List<FlightsEntity>>> getFlightsByDateAndIata(
    String originIata,
    String destinationIata,
    int passengers,
    DateTime departureDate,
  ) async {
    try {
      final response =
          await client.get('shopping/flight-offers', queryParameters: {
        'originLocationCode': originIata,
        'destinationLocationCode': destinationIata,
        'adults': passengers,
        'currencyCode': 'BRL',
        'nonStop': false,
        'max': 50,
        'departureDate': DateFormat('yyyy-MM-dd').format(departureDate),
      });

      final List list = response.data;

      final flights = list
          .map(
            (e) => FlightsModel.fromMap(e['data'][0]).toEntity(),
          )
          .toList();

      return right(flights);
    } on DioError catch (e) {
      switch (e.response!.statusCode) {
        case 400:
          return left(FlightsFailure.badRequest);
        case 401:
          return left(FlightsFailure.expiredToken);
        default:
          return left(FlightsFailure.serverError);
      }
    }
  }
}
