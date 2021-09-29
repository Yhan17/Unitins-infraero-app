import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../env.dart';
import '../../domain/core/failures/service_failures.dart';
import '../../domain/services/credentials_service.dart';
import '../core/http/credentials_client.dart';

class CredentialsServiceImpl extends CredentialsService {
  final CredentialsHttpClient client;

  CredentialsServiceImpl(this.client);

  @override
  Future<Either<FlightsTokenFailure, Unit>> getFlightApiToken() async {
    try {
      final preferences = await SharedPreferences.getInstance();
      final response = await client.post(
        'security/oauth2/token',
        data: {
          'grant_type': 'client_credentials',
          'client_id': Env.clientId,
          'client_secret': Env.clientSecret,
        },
        options: Options(contentType: Headers.formUrlEncodedContentType),
      );
      await preferences.setString("tokenjwt", response.data["access_token"]);

      return right(unit);
    } on DioError catch (e) {
      switch (e.response!.statusCode) {
        case 400:
          return left(FlightsTokenFailure.badRequest);
        default:
          return left(FlightsTokenFailure.serverError);
      }
    } on Exception catch (_) {
      return left(FlightsTokenFailure.tokenSaveError);
    }
  }
}
