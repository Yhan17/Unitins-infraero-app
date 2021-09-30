import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infraero/app/presentation/core/routes/router.gr.dart';

import '../../../../domain/core/failures/service_failures.dart';
import '../../../core/routes/args/home_args.dart';
import '../../../core/routes/args/passenger_select_args.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_illustration.dart';
import '../../../shared/widgets/common_button_widget.dart';
import '../../../shared/widgets/default_scaffold_widget.dart';
import '../../../shared/widgets/error_modal_widget.dart';
import '../notifiers/airport_form_notifier.dart';
import '../notifiers/search_flights_notifier.dart';

class PassengerSelectPage extends HookWidget {
  final PassengerSelectArgs pageArgs;
  const PassengerSelectPage({
    Key? key,
    required this.pageArgs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _currentSliderValue = useState<double>(1);
    final searchFlightsNotifier =
        useProvider(searchFlightsNotifierProvider.notifier);
    final airportFormNotifier =
        useProvider(airportFormNotifierProvider.notifier);
    final departureDate = airportFormNotifier.last.departureDate;
    return DefaultScaffoldWidget(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            AppIllustrations.passengerAirportIllustration,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 19,
            ).copyWith(top: 58),
            child: const Text(
              'Para finalizar indique quantas pessoas irão viajar',
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
            child: Slider(
              value: _currentSliderValue.value,
              min: 1,
              max: 15,
              divisions: 15,
              activeColor: AppColors.primaryColor,
              thumbColor: AppColors.primaryColor,
              label: _currentSliderValue.value.round().toString(),
              onChanged: (double value) {
                _currentSliderValue.value = value;
                airportFormNotifier.changePassengers(
                  int.parse(value.round().toString()),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 19),
            child: ProviderListener<SearchFlightState>(
              onChange: (context, state) {
                state.maybeWhen(
                  loadFailure: (failure) {
                    switch (failure) {
                      case FlightsFailure.badRequest:
                        const ErrorModalWidget(
                          text: 'Houve um problema com a requisição',
                        ).show(context);
                        break;
                      case FlightsFailure.expiredToken:
                        const ErrorModalWidget(
                          text:
                              'Ops parece que seu token expirou reinicie o app',
                        ).show(context);
                        break;
                      case FlightsFailure.serverError:
                        const ErrorModalWidget(
                          text: 'Ops parece que algo deu errado no servidor',
                        ).show(context);
                        break;
                    }
                  },
                  loadSuccess: (listFlights) {
                    final HomeArgs args = HomeArgs(
                      pageArgs.destiny,
                      pageArgs.origin,
                      listFlights,
                    );
                     AutoRouter.of(context).push(
                        HomeRoute(pageArgs: args),
                      );
                  },
                  orElse: () {},
                );
              },
              provider: searchFlightsNotifierProvider,
              child: Consumer(
                builder: (_, watch, __) {
                  final state = watch(searchFlightsNotifierProvider);
                  return CommonButtonWidget(
                    text: 'Finalizar',
                    busy: state.maybeWhen(
                      loadInProgress: () => true,
                      orElse: () => false,
                    ),
                    onTap: () {
                      searchFlightsNotifier.getFlights(
                        originIata: airportFormNotifier.last.originAirport,
                        destinationIata:
                            airportFormNotifier.last.destinyAirport,
                        passengers: airportFormNotifier.last.passengers,
                        departureDate: departureDate!,
                      );
                    },
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
