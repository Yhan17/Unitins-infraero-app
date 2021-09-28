import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

import '../../../../env.dart';

class AirportHttpClient extends DioMixin {
  final Map<String, dynamic>? headers;

  AirportHttpClient({this.headers});
  @override
  HttpClientAdapter get httpClientAdapter => DefaultHttpClientAdapter();

  @override
  BaseOptions get options => BaseOptions(
        baseUrl: Env.airportApiUrl,
        headers: headers ?? {
          'Accept': 'application/json',
        },
      );
}
