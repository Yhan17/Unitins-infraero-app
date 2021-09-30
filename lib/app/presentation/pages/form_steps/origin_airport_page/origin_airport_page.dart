import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../domain/core/failures/service_failures.dart';
import '../../../core/routes/args/destiny_airport_args.dart';
import '../../../core/routes/router.gr.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_illustration.dart';
import '../../../shared/widgets/common_button_widget.dart';
import '../../../shared/widgets/default_scaffold_widget.dart';
import '../../../shared/widgets/error_modal_widget.dart';
import '../notifiers/airport_form_notifier.dart';
import 'notifier/origin_airport_notifier.dart';

class OriginAirportPage extends HookWidget {
  const OriginAirportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final originAirporNotifier =
        useProvider(originAirporNotifierProvider.notifier);
    return DefaultScaffoldWidget(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            AppIllustrations.originAirportIllustration,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
            ).copyWith(top: 58),
            child: const Text(
              'Vamos começar com o aeroporto de origem',
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
            child: const _OriginAirportTextInput(),
          ),
          _ContinueButton(
            originAirporNotifier: originAirporNotifier,
          )
        ],
      ),
    );
  }
}

class _OriginAirportTextInput extends HookWidget {
  const _OriginAirportTextInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final airportFormNotifier =
        useProvider(airportFormNotifierProvider.notifier);
    final originAirportController =
        useTextEditingController(text: airportFormNotifier.last.originAirport);

    return TextFormField(
      maxLength: 3,
      onChanged: airportFormNotifier.changeOriginAirport,
      textCapitalization: TextCapitalization.characters,
      decoration: const InputDecoration(
        labelText: 'Iniciais do Aeroporto',
        helperText: 'EX: GRU',
        enabled: true,
      ),
      style: TextStyle(color: AppColors.primaryColor),
      controller: originAirportController,
    );
  }
}

class _ContinueButton extends HookWidget {
  final OriginAirportNotifier originAirporNotifier;
  const _ContinueButton({
    Key? key,
    required this.originAirporNotifier,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final canContinue = useProvider(airportFormNotifierProvider
        .select((value) => value.originAirportCanContinue));
    final originIata = useProvider(
        airportFormNotifierProvider.select((value) => value.originAirport));

    return ProviderListener<OriginAirportState>(
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
          loadSuccess: (originAirport) {
            final DestinyAirportArgs args = DestinyAirportArgs(originAirport);
            // AutoRouter.of(context).push(
            //   DestinyAirportRoute(args: args),
            // );
          },
          orElse: () {},
        );
      },
      provider: originAirporNotifierProvider,
      child: Consumer(
        builder: (_, watch, __) {
          final state = watch(originAirporNotifierProvider);
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 19),
            child: CommonButtonWidget(
              text: 'Vamos lá',
              busy: state.maybeWhen(
                loadInProgress: () => true,
                orElse: () => false,
              ),
              onTap: canContinue
                  ? () async {
                      await originAirporNotifier.getAirport(originIata);
                    }
                  : null,
            ),
          );
        },
      ),
    );
  }
}
