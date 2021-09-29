import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_illustration.dart';
import '../../shared/widgets/common_button_widget.dart';
import '../../shared/widgets/default_scaffold_widget.dart';

class DateTripPickerPage extends HookWidget {
  const DateTripPickerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dateCtl = useTextEditingController();

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
                    lastDate: DateTime(2100)))!;

                dateCtl.text = date.toString();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 19),
            child: CommonButtonWidget(
              text: 'Continuar',
              onTap: () {
                AutoRouter.of(context).pushNamed('/passenger-select');
              },
            ),
          )
        ],
      ),
    );
  }
}
