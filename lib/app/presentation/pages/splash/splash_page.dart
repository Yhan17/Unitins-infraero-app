import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/core/failures/service_failures.dart';
import '../../core/theme/app_images.dart';
import '../../shared/widgets/error_modal_widget.dart';
import 'notifier/splahs_screen_notifier.dart';

class SplashPage extends HookWidget {
  const SplashPage({Key? key}) : super(key: key);

  void _getCredentials(
      SplashScreenNotifier notifier, BuildContext context) async {
    await notifier.getCredentials();

    notifier.last.maybeWhen(
      loadSuccess: (unit) async {
        await Future.delayed(const Duration(seconds: 2));
        AutoRouter.of(context).replaceNamed('/origin-airport');
      },
      loadFailure: (failure) {
        switch (failure) {
          case FlightsTokenFailure.badRequest:
            const ErrorModalWidget(
              text: 'Opa Parece que a requisição para a api não teve sucesso',
            ).show(context);
            break;
          case FlightsTokenFailure.expiredToken:
            const ErrorModalWidget(
              text: 'Opa Parece que seu token expirou, reestarta o app aí',
            ).show(context);
            break;
          case FlightsTokenFailure.serverError:
            const ErrorModalWidget(
              text: 'Opa Parece que tem algo de errado com o servidor',
            ).show(context);
            break;
          case FlightsTokenFailure.tokenSaveError:
            const ErrorModalWidget(
              text: 'Opa Parece que o token não pode ser salvo',
            ).show(context);
            break;
        }
      },
      orElse: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    final splashNotifier = useProvider(splashScreenNotifierProvider.notifier);

    useEffect(() {
      // _getCredentials(
      //   splashNotifier,
      //   context,
      // );
      AutoRouter.of(context).replaceNamed('/origin-airport');
      return () {};
    }, const []);

    return Scaffold(
      body: Center(
        child: Image.asset(AppImages.logo),
      ),
    );
  }
}
