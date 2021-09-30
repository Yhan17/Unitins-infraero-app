import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../infra/core/http/airport_client.dart';
import '../../../infra/core/http/credentials_client.dart';
import '../../../infra/core/http/flight_client.dart';
import '../../../infra/services/airport_service_impl.dart';
import '../../../infra/services/credentials_service_impl.dart';
import '../../../infra/services/flight_service_impl.dart';

final credentialsHttpClient = Provider<CredentialsHttpClient>(
  (_) => CredentialsHttpClient(),
);

final airportHttpClient = Provider<AirportHttpClient>(
  (_) => AirportHttpClient(),
);

final flightHttpClient = Provider<FlightHttpClient>(
  (_) => FlightHttpClient(),
);

final credentialsService = Provider<CredentialsServiceImpl>(
  (ref) => CredentialsServiceImpl(ref.read(credentialsHttpClient)),
);

final airportService = Provider<AirportServiceImpl>(
  (ref) => AirportServiceImpl(ref.read(airportHttpClient)),
);

final flightService = Provider<FlightServiceImpl>(
  (ref) => FlightServiceImpl(ref.read(flightHttpClient)),
);
