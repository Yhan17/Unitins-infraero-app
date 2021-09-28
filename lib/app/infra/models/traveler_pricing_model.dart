import 'dart:convert';

import '../../domain/entities/traveler_pricing_entity.dart';

class TravelerPricingModel {
  final int travelerId;
  final String travelerType;
  final String price;
  final String fareOption;

  const TravelerPricingModel({
    required this.travelerId,
    required this.travelerType,
    required this.price,
    required this.fareOption,
  });

  Map<String, dynamic> toMap() {
    return {
      'travelerId': travelerId,
      'travelerType': travelerType,
      'price': price,
      'fareOption': fareOption,
    };
  }

  factory TravelerPricingModel.fromMap(Map<String, dynamic> map) {
    return TravelerPricingModel(
      travelerId: map['travelerId'],
      travelerType: map['travelerType'],
      price: map['price']['total'],
      fareOption: map['fareOption'],
    );
  }

  factory TravelerPricingModel.fromEntity(TravelerPricingEntity entity) {
    return TravelerPricingModel(
      fareOption: entity.fareOption,
      price: entity.price,
      travelerId: entity.travelerId,
      travelerType: entity.travelerType,
    );
  }

  TravelerPricingEntity toEntity() => TravelerPricingEntity(
        fareOption: fareOption,
        price: price,
        travelerId: travelerId,
        travelerType: travelerType,
      );

  String toJson() => json.encode(toMap());

  factory TravelerPricingModel.fromJson(String source) =>
      TravelerPricingModel.fromMap(json.decode(source));
}
