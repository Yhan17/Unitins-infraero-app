
import 'package:equatable/equatable.dart';

class TravelerPricingEntity extends Equatable {
  final int travelerId;
  final String travelerType;
  final String price;
  final String fareOption;

  const TravelerPricingEntity({
    required this.travelerId,
    required this.travelerType,
    required this.price,
    required this.fareOption,
  });

  @override
  List<Object?> get props => [
        travelerId,
        travelerType,
        price,
        fareOption,
      ];
}
