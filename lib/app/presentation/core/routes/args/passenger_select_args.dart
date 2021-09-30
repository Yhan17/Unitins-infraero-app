import '../../../../domain/entities/airport_entity.dart';

class PassengerSelectArgs {
  final AirportEntity destiny;
  final AirportEntity origin;
  final DateTime? departureDate;

  const PassengerSelectArgs({
    required this.origin,
    required this.destiny,
    required this.departureDate,
  });
}
