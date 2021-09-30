import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../domain/core/failures/service_failures.dart';
import '../../../../../domain/entities/airport_entity.dart';
import '../../../../../domain/services/airport_service.dart';
import '../../../../core/common_state/common_state.dart';
import '../../../../core/providers/core_providers.dart';

typedef OriginAirportState = CommonState<AirportFailures, AirportEntity>;

class OriginAirportNotifier extends StateNotifier<OriginAirportState> {
  final AirportService _service;
  OriginAirportNotifier(this._service) : super(const OriginAirportState.initial());

  OriginAirportState get last => state;

  Future<void> getAirport(String iata) async {
    state = const OriginAirportState.loadInProgress();
    final result = await _service.getAirportInfo(iata);

    result.fold(
      (airportFailures) =>
          state = OriginAirportState.loadFailure(airportFailures),
      (airportEntity) => state = OriginAirportState.loadSuccess(airportEntity),
    );
  }
}

final originAirporNotifierProvider = StateNotifierProvider.autoDispose<
    OriginAirportNotifier, OriginAirportState>(
  (ref) => OriginAirportNotifier(ref.read(airportService)),
);