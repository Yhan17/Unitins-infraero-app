import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../domain/core/failures/service_failures.dart';
import '../../../../../domain/entities/airport_entity.dart';
import '../../../../../domain/services/airport_service.dart';
import '../../../../core/common_state/common_state.dart';
import '../../../../core/providers/core_providers.dart';

typedef DestinyAirportState = CommonState<AirportFailures, AirportEntity>;

class DestinyAirportNotifier extends StateNotifier<DestinyAirportState> {
  final AirportService _service;
  DestinyAirportNotifier(this._service) : super(const DestinyAirportState.initial());

  DestinyAirportState get last => state;

  Future<void> getAirport(String iata) async {
    state = const DestinyAirportState.loadInProgress();
    final result = await _service.getAirportInfo(iata);

    result.fold(
      (airportFailures) =>
          state = DestinyAirportState.loadFailure(airportFailures),
      (airportEntity) => state = DestinyAirportState.loadSuccess(airportEntity),
    );
  }
}

final destinyAirporNotifierProvider = StateNotifierProvider.autoDispose<
    DestinyAirportNotifier, DestinyAirportState>(
  (ref) => DestinyAirportNotifier(ref.read(airportService)),
);