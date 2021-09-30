import 'package:flutter/material.dart';
import 'package:infraero/app/presentation/utils/app_pipes.dart';
import '../../../core/theme/app_images.dart';

import '../../../core/theme/app_colors.dart';
import 'money_card_widget.dart';
import 'passenger_text_widget.dart';

class PassengerInformationWidget extends StatelessWidget {
  final String travelerId;
  final String total;
  final String code;
  final String fareOption;
  final String travelerType;
  const PassengerInformationWidget({
    Key? key,
    required this.travelerId,
    required this.total,
    required this.code,
    required this.fareOption,
    required this.travelerType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 14),
        constraints: const BoxConstraints(
          maxWidth: 115,
        ),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
          color: AppColors.cardColor,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PassengerTextWidget(
                  title: 'Passageiro',
                  text: travelerId,
                  textAlign: TextAlign.start,
                ),
                MoneyCardWidget(
                  value: AppPipes.formatMoney(double.parse(total)),
                ),
              ],
            ),
            Container(
              height: 1.0,
              color: Colors.black,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PassengerTextWidget(
                  text: 'Voo',
                  textAlign: TextAlign.start,
                  title: code,
                ),
                PassengerTextWidget(
                  text: 'Ala',
                  textAlign: TextAlign.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  title: fareOption,
                ),
                PassengerTextWidget(
                  text: 'type',
                  textAlign: TextAlign.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  title: travelerType,
                ),
              ],
            ),
            Container(
              height: 1.0,
              color: Colors.black,
            ),
            Image.asset(AppImages.barcode)
          ],
        ),
      ),
    );
  }
}
