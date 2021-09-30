import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/routes/args/date_trip_picker_args.dart';
import '../../../core/routes/args/passenger_select_args.dart';
import '../../../core/routes/router.gr.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_illustration.dart';
import '../../../shared/widgets/common_button_widget.dart';
import '../../../shared/widgets/default_scaffold_widget.dart';
import '../notifiers/airport_form_notifier.dart';

class DateTripPickerPage extends HookWidget {
  final DateTripPickerArgs pageArgs;
  const DateTripPickerPage({
    Key? key,
    required this.pageArgs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dateCtl = useTextEditingController();
    final canContinue = useProvider(airportFormNotifierProvider
        .select((value) => value.departureDateCanContinue));
    final airportFormNotifier =
        useProvider(airportFormNotifierProvider.notifier);
    return DefaultScaffoldWidget(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            AppIllustrations.datePickerAirportIllustration,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 19,
            ).copyWith(top: 58),
            child: const Text(
              'Selecione a data que deseja consultar os voôs',
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
            child: TextFormField(
              controller: dateCtl,
              decoration: const InputDecoration(
                labelText: "Data para o embarque",
              ),
              style: TextStyle(color: AppColors.primaryColor),
              onTap: () async {
                DateTime date = DateTime(1900);
                FocusScope.of(context).requestFocus(FocusNode());

                date = (await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100),
                ))!;

                dateCtl.text = DateFormat('d/MM/y')
                    .format(DateTime.parse(date.toString()));
                airportFormNotifier.changeDepartureDate(DateTime.parse(date.toString()));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 19),
            child: CommonButtonWidget(
              text: 'Continuar',
              onTap: canContinue
                  ? () {
                      final PassengerSelectArgs args = PassengerSelectArgs(
                        origin: pageArgs.origin,
                        destiny: pageArgs.destiny,
                        departureDate: airportFormNotifier.last.departureDate,
                      );
                      AutoRouter.of(context).push(
                        PassengerSelectRoute(pageArgs: args),
                      );
                    }
                  : null,
            ),
          )
        ],
      ),
    );
  }
}
