import 'dart:convert';

import '../../domain/entities/flights_entity.dart';
import 'price_model.dart';
import 'segment_model.dart';
import 'traveler_pricing_model.dart';

class FlightsModel {
  final DateTime lastTicketingDate;
  final int numberOfBookableSeats;
  final String duration;
  final List<SegmentModel> segments;
  final PriceModel price;
  final List<TravelerPricingModel> travelerPricings;

  const FlightsModel({
    required this.lastTicketingDate,
    required this.numberOfBookableSeats,
    required this.duration,
    required this.segments,
    required this.price,
    required this.travelerPricings,
  });

  Map<String, dynamic> toMap() {
    return {
      'lastTicketingDate': lastTicketingDate.millisecondsSinceEpoch,
      'numberOfBookableSeats': numberOfBookableSeats,
      'duration': duration,
      'segments': segments.map((x) => x.toMap()).toList(),
      'price': price.toMap(),
      'travelerPricings': travelerPricings.map((x) => x.toMap()).toList(),
    };
  }

  factory FlightsModel.fromMap(Map<String, dynamic> map) {
    return FlightsModel(
      lastTicketingDate: DateTime.parse(
        map['lastTicketingDate'],
      ),
      numberOfBookableSeats: map['numberOfBookableSeats'],
      duration: map['itineraries'][0]['duration'],
      segments: List<SegmentModel>.from(map['itineraries'][0]['segments']
          ?.map((x) => SegmentModel.fromMap(x))),
      price: PriceModel.fromMap(map['price']),
      travelerPricings: List<TravelerPricingModel>.from(
          map['travelerPricings']?.map((x) => TravelerPricingModel.fromMap(x))),
    );
  }

  factory FlightsModel.fromEntity(FlightsEntity entity) {
    return FlightsModel(
      duration: entity.duration,
      lastTicketingDate: entity.lastTicketingDate,
      numberOfBookableSeats: entity.numberOfBookableSeats,
      price: PriceModel.fromEntity(entity.price),
      segments: entity.segments.map((e) => SegmentModel.fromEntity(e)).toList(),
      travelerPricings: entity.travelerPricings
          .map((e) => TravelerPricingModel.fromEntity(e))
          .toList(),
    );
  }

  FlightsEntity toEntity() => FlightsEntity(
        duration: duration,
        lastTicketingDate: lastTicketingDate,
        numberOfBookableSeats: numberOfBookableSeats,
        price: price.toEntity(),
        segments: segments.map((e) => e.toEntity()).toList(),
        travelerPricings: travelerPricings.map((e) => e.toEntity()).toList(),
      );

  String toJson() => json.encode(toMap());

  factory FlightsModel.fromJson(String source) =>
      FlightsModel.fromMap(json.decode(source));
}
