import 'package:freezed_annotation/freezed_annotation.dart';

part 'airport_form_state.freezed.dart';

@freezed
abstract class AirportFormState with _$AirportFormState {
  const AirportFormState._();

  factory AirportFormState({
    required String originAirport,
    required String destinyAirport,
    required DateTime? departureDate,
    required int passengers,
  }) = _AirportFormState;

  factory AirportFormState.initial() => AirportFormState(
        originAirport: '',
        destinyAirport: '',
        departureDate: null,
        passengers: 1
      );

    bool get originAirportCanContinue => originAirport.length == 3;
    bool get destinyAirportCanContinue => destinyAirport.length == 3;
    bool get departureDateCanContinue => departureDate != null;

}
