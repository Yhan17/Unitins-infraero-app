import 'package:flutter/material.dart';
import '../../../core/theme/app_images.dart';

import '../../../core/theme/app_colors.dart';
import 'money_card_widget.dart';
import 'passenger_text_widget.dart';

class PassengerInformationWidget extends StatelessWidget {
  const PassengerInformationWidget({Key? key}) : super(key: key);

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
              children: const [
                PassengerTextWidget(
                  text: '1',
                  textAlign: TextAlign.start,
                  title: 'Passageiros',
                ),
                MoneyCardWidget(
                  value: r'R$ 680,90',
                ),
              ],
            ),
            Container(
              height: 1.0,
              color: Colors.black,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                PassengerTextWidget(
                  text: 'Voo',
                  textAlign: TextAlign.start,
                  title: '3522',
                ),
                PassengerTextWidget(
                  text: 'Ala',
                  textAlign: TextAlign.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  title: 'Standard',
                ),
                PassengerTextWidget(
                  text: 'type',
                  textAlign: TextAlign.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  title: 'Adult',
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
