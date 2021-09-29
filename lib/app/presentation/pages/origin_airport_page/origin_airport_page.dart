import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../shared/widgets/default_scaffold_widget.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_illustration.dart';
import '../../shared/widgets/common_button_widget.dart';

class OriginAirportPage extends HookWidget {
  const OriginAirportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final originAirportController = useTextEditingController(text: '');
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
            child: TextField(
              maxLength: 3,
              textCapitalization: TextCapitalization.characters,
              decoration: const InputDecoration(
                labelText: 'Iniciais do Aeroporto',
                helperText: 'EX: GRU',
                enabled: true,
              ),
              style: TextStyle(color: AppColors.primaryColor),
              controller: originAirportController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 19),
            child: CommonButtonWidget(
              text: 'Vamos lá',
              onTap: () {
                AutoRouter.of(context).pushNamed('/destiny-airport');
              },
            ),
          )
        ],
      ),
    );
  }
}
