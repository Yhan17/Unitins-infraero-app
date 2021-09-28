import 'dart:convert';

import '../../domain/entities/price_entity.dart';

class PriceModel {
  final double total;
  final double base;
  final String currency;
  final List<AdditionalServicesModel> additionalServices;
  const PriceModel({
    required this.total,
    required this.base,
    required this.currency,
    required this.additionalServices,
  });

  Map<String, dynamic> toMap() {
    return {
      'total': total,
      'base': base,
      'currency': currency,
      'additionalServices': additionalServices.map((x) => x.toMap()).toList(),
    };
  }

  factory PriceModel.fromEntity(PriceEntity entity) {
    return PriceModel(
      total: entity.total,
      base: entity.base,
      currency: entity.currency,
      additionalServices: entity.additionalServices
          .map(
            (e) => AdditionalServicesModel(
              amount: e.amount,
              type: e.type,
            ),
          )
          .toList(),
    );
  }

  PriceEntity toEntity() => PriceEntity(
        additionalServices:
            additionalServices.map((e) => e.toEntity()).toList(),
        base: base,
        currency: currency,
        total: total,
      );

  factory PriceModel.fromMap(Map<String, dynamic> map) {
    return PriceModel(
      total: map['total'],
      base: map['base'],
      currency: map['currency'],
      additionalServices: List<AdditionalServicesModel>.from(
          map['additionalServices']
              ?.map((x) => AdditionalServicesModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory PriceModel.fromJson(String source) =>
      PriceModel.fromMap(json.decode(source));
}

class AdditionalServicesModel {
  final double amount;
  final String type;
  AdditionalServicesModel({
    required this.amount,
    required this.type,
  });

  Map<String, dynamic> toMap() {
    return {
      'amount': amount,
      'type': type,
    };
  }

  factory AdditionalServicesModel.fromMap(Map<String, dynamic> map) {
    return AdditionalServicesModel(
      amount: map['amount'],
      type: map['type'],
    );
  }

  factory AdditionalServicesModel.fromEntity(AdditionalServicesEntity entity) {
    return AdditionalServicesModel(
      amount: entity.amount,
      type: entity.type,
    );
  }

  AdditionalServicesEntity toEntity() => AdditionalServicesEntity(
        amount: amount,
        type: type,
      );

  String toJson() => json.encode(toMap());

  factory AdditionalServicesModel.fromJson(String source) =>
      AdditionalServicesModel.fromMap(json.decode(source));
}
