import 'package:equatable/equatable.dart';

class AircraftEntity extends Equatable {
  final String code;

  const AircraftEntity({
    required this.code,
  });
  @override
  List<Object> get props => [
        code,
      ];
}
