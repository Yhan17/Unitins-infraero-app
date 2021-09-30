import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../domain/core/failures/service_failures.dart';
import '../../../core/routes/args/date_trip_picker_args.dart';
import '../../../core/routes/args/destiny_airport_args.dart';
import '../../../core/routes/router.gr.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_illustration.dart';
import '../../../shared/widgets/common_button_widget.dart';
import '../../../shared/widgets/default_scaffold_widget.dart';
import '../../../shared/widgets/error_modal_widget.dart';
import '../notifiers/airport_form_notifier.dart';
import 'notifier/destiny_airport_notifier.dart';

class DestinyAirportPage extends HookWidget {
  final DestinyAirportArgs args;
  const DestinyAirportPage({
    Key? key,
    required this.args,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final destinyAirportNotifier =
        useProvider(destinyAirporNotifierProvider.notifier);
    return DefaultScaffoldWidget(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            AppIllustrations.destinyAirportIllustration,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
            ).copyWith(top: 58),
            child: const Text(
              'Agora indique o aeroporto de destino',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 19,
            ).copyWith(bottom: 35),
            child: const _DestinyAirportTextInput(),
          ),
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 19),
            child: _ContinueButton(
             destinyAirportNotifier: destinyAirportNotifier,
             pageArgs: args,
            ),
          )
        ],
      ),
    );
  }
}

class _DestinyAirportTextInput extends HookWidget {
  const _DestinyAirportTextInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final airportFormNotifier =
        useProvider(airportFormNotifierProvider.notifier);
    final destinyAirportController =
        useTextEditingController(text: airportFormNotifier.last.destinyAirport);

    return TextFormField(
      maxLength: 3,
      onChanged: airportFormNotifier.changeDestiniAirport,
      textCapitalization: TextCapitalization.characters,
      decoration: const InputDecoration(
        labelText: 'Iniciais do Aeroporto',
        helperText: 'EX: GRU',
        enabled: true,
      ),
      style: TextStyle(color: AppColors.primaryColor),
      controller: destinyAirportController,
    );
  }
}

class _ContinueButton extends HookWidget {
  final DestinyAirportNotifier destinyAirportNotifier;
  final DestinyAirportArgs pageArgs;
  const _ContinueButton({
    Key? key,
    required this.destinyAirportNotifier,
    required this.pageArgs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final canContinue = useProvider(airportFormNotifierProvider
        .select((value) => value.destinyAirportCanContinue));
    final destinyIata = useProvider(
        airportFormNotifierProvider.select((value) => value.destinyAirport));

    return ProviderListener<DestinyAirportState>(
      onChange: (context, state) {
        state.maybeWhen(
          loadFailure: (failure) {
            switch (failure) {
              case AirportFailures.unknownAirport:
                const ErrorModalWidget(
                  text: 'Aeroporto não encontrado',
                ).show(context);
                break;
              case AirportFailures.expiredToken:
                const ErrorModalWidget(
                  text: 'Parece que seu token de acesso expirou',
                ).show(context);
                break;
              case AirportFailures.serverError:
                const ErrorModalWidget(
                  text: 'O servidor tá com problema se lascou',
                ).show(context);
                break;
            }
          },
          loadSuccess: (destinyAirport) {
            final DateTripPickerArgs args = DateTripPickerArgs(
                origin: pageArgs.origin, destiny: destinyAirport);
            AutoRouter.of(context).push(
              DateTripPickerRoute(pageArgs: args),
            );
          },
          orElse: () {},
        );
      },
      provider: destinyAirporNotifierProvider,
      child: Consumer(
        builder: (_, watch, __) {
          final state = watch(destinyAirporNotifierProvider);
          return CommonButtonWidget(
            text: 'Continuar',
            busy: state.maybeWhen(
              loadInProgress: () => true,
              orElse: () => false,
            ),
            onTap: canContinue
                ? () async {
                    await destinyAirportNotifier.getAirport(destinyIata);
                  }
                : null,
          );
        },
      ),
    );
  }
}
