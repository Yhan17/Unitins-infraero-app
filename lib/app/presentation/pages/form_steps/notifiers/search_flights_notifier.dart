import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../domain/services/flight_service.dart';
import '../../../core/providers/core_providers.dart';

import '../../../../domain/core/failures/service_failures.dart';
import '../../../../domain/entities/flights_entity.dart';
import '../../../core/common_state/common_state.dart';

typedef SearchFlightState = CommonState<FlightsFailure, List<FlightsEntity>>;

class SearchFlightsNotifier extends StateNotifier<SearchFlightState> {
  final FlightService _service;
  SearchFlightsNotifier(this._service)
      : super(const SearchFlightState.initial());

  SearchFlightState get last => state;

  Future<void> getFlights({
    required String originIata,
    required String destinationIata,
    required int passengers,
    required DateTime departureDate,
  }) async {
    state = const SearchFlightState.loadInProgress();
    final result = await _service.getFlightsByDateAndIata(
      originIata,
      destinationIata,
      passengers,
      departureDate,
    );

    result.fold(
      (flightFailures) =>
          state = SearchFlightState.loadFailure(flightFailures),
      (flights) => state = SearchFlightState.loadSuccess(flights),
    );
  }
}

final searchFlightsNotifierProvider =
    StateNotifierProvider.autoDispose<SearchFlightsNotifier, SearchFlightState>(
  (ref) => SearchFlightsNotifier(ref.read(flightService)),
);
