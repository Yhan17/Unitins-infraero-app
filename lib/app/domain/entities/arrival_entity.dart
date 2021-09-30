import 'package:equatable/equatable.dart';

class ArrivalEntity extends Equatable {
  final String iataCode;
  final String? terminal;
  final DateTime at;

  const ArrivalEntity({
    required this.iataCode,
    required this.terminal,
    required this.at,
  });

  @override
  List<Object?> get props => [
        iataCode,
        terminal,
        at,
      ];
}
