import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../infra/core/http/credentials_client.dart';
import '../../../infra/services/credentials_service_impl.dart';

final credentialsHttpClient = Provider<CredentialsHttpClient>(
  (_) => CredentialsHttpClient(),
);

final credentialsService = Provider<CredentialsServiceImpl>(
  (ref) => CredentialsServiceImpl(ref.read(credentialsHttpClient)),
);
