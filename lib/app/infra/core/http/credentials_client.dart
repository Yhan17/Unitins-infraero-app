import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

import '../../../../env.dart';

class CredentialsHttpClient extends DioMixin {
  @override
  HttpClientAdapter get httpClientAdapter => DefaultHttpClientAdapter();

  @override
  BaseOptions get options => BaseOptions(
        baseUrl: Env.flightV1Api,
        headers: {
          'Accept': 'application/json',
        },
      );
}
