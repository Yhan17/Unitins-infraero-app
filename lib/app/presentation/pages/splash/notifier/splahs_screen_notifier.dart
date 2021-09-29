import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../domain/core/failures/service_failures.dart';
import '../../../../domain/services/credentials_service.dart';
import '../../../core/common_state/common_state.dart';
import '../../../core/providers/core_providers.dart';

typedef SplashState = CommonState<FlightsTokenFailure, Unit>;

class SplashScreenNotifier extends StateNotifier<SplashState> {
  final CredentialsService _service;

  SplashScreenNotifier(this._service) : super(const SplashState.initial());

  SplashState get last => state;

  Future<void> getCredentials() async {
    state = const SplashState.loadInProgress();
    final result = await _service.getFlightApiToken();

    result.fold(
      (flightTokenFailure) =>
          state = SplashState.loadFailure(flightTokenFailure),
      (unit) => state = SplashState.loadSuccess(unit),
    );
  }
}

final splashScreenNotifierProvider =
    StateNotifierProvider.autoDispose<SplashScreenNotifier, SplashState>(
  (ref) => SplashScreenNotifier(ref.read(credentialsService)),
);
