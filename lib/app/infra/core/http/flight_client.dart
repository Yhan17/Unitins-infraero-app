import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

import '../../../../env.dart';

class FlightHttpClient extends DioMixin {
  final Map<String, dynamic>? headers;

  FlightHttpClient({this.headers});

  @override
  HttpClientAdapter get httpClientAdapter => DefaultHttpClientAdapter();

  @override
  BaseOptions get options => BaseOptions(
        baseUrl: Env.flightV2Api,
        headers: headers ?? {
          'Accept': 'application/json',
        },
      );
}
