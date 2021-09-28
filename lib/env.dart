import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  static late final String rapidApiToken;
  static late final String clientId;
  static late final String clientSecret;
  static late final String airportApiUrl;
  static late final String flightV1Api;
  static late final String flightV2Api;

  static Future<void> init({String fileName = '.env'}) async {
    await dotenv.load(fileName: fileName);

    rapidApiToken = dotenv.env['RAPIDAPITOKEN']!;
    clientId = dotenv.env['CLIENTID']!;
    clientSecret = dotenv.env['CLIENTSECRET']!;
    airportApiUrl = dotenv.env['AIRPORTAPIURL']!;
    flightV1Api = dotenv.env['FLIGHTV1SAPIURL']!;
    flightV2Api = dotenv.env['FLIGHTV2SAPIURL']!;
  }
}
