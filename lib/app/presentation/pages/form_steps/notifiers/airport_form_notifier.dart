import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'airport_form_state.dart';

class AirportFormNotifier extends StateNotifier<AirportFormState> {
  AirportFormNotifier() : super(AirportFormState.initial());

  AirportFormState get last => state;

  void changeOriginAirport(String originAirport) {
    state = state.copyWith(originAirport: originAirport);
  }

  void changeDestiniAirport(String destinyAirport) {
    state = state.copyWith(destinyAirport: destinyAirport);
  }

  void changeDepartureDate(DateTime departureDate) {
    state = state.copyWith(departureDate: departureDate);
  }

  void changePassengers(int passengers) {
    state = state.copyWith(passengers: passengers);
  }
}

final airportFormNotifierProvider =
    StateNotifierProvider.autoDispose<AirportFormNotifier, AirportFormState>(
  (ref) => AirportFormNotifier(),
);
