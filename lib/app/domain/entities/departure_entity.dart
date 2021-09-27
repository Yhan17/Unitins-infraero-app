import 'package:equatable/equatable.dart';

class DepartureEntity extends Equatable {
  final String iataCode;
  final DateTime at;

  const DepartureEntity({
    required this.iataCode,
    required this.at,
  });

  @override
  List<Object?> get props => [
        iataCode,
        at,
      ];
}