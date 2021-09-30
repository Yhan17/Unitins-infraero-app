import '../../../../domain/entities/airport_entity.dart';

class DateTripPickerArgs {
  final AirportEntity destiny;
  final AirportEntity origin;

  const DateTripPickerArgs({
    required this.origin,
    required this.destiny,
  });
}
