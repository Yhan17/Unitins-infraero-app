import 'package:equatable/equatable.dart';
import 'package:infraero/app/domain/entities/traveler_pricing_entity.dart';

import 'price_entity.dart';
import 'segment_entity.dart';

class FlightsEntity extends Equatable {
  final DateTime lastTicketingDate;
  final int numberOfBookableSeats;
  final String duration;
  final List<SegmentEntity> segments;
  final PriceEntity price;
  final List<TravelerPricingEntity> travelerPricings;

  const FlightsEntity({
    required this.lastTicketingDate,
    required this.numberOfBookableSeats,
    required this.duration,
    required this.segments,
    required this.price,
    required this.travelerPricings,
  });
  @override
  List<Object?> get props => [];
}
