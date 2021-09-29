import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_illustration.dart';
import '../../shared/widgets/common_button_widget.dart';
import '../../shared/widgets/default_scaffold_widget.dart';

class PassengerSelectPage extends HookWidget {
  const PassengerSelectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _currentSliderValue = useState<double>(1);

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
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 19),
            child: CommonButtonWidget(
              text: 'Finalizar',
            ),
          )
        ],
      ),
    );
  }
}
