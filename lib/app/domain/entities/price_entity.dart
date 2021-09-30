import 'package:equatable/equatable.dart';

class PriceEntity extends Equatable {
  final double total;
  final double base;
  final String currency;
  final List<AdditionalServicesEntity>? additionalServices;

  const PriceEntity({
    required this.total,
    required this.base,
    required this.currency,
    required this.additionalServices,
  });
  @override
  List<Object> get props => [];
}

class AdditionalServicesEntity extends Equatable {
  final double amount;
  final String type;

  const AdditionalServicesEntity({
    required this.amount,
    required this.type,
  });
  @override
  List<Object> get props => [
        amount,
        type,
      ];
}
