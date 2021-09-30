import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timelines/timelines.dart';

import '../../core/theme/app_colors.dart';
import 'widgets/flight_card_widget.dart';

class HomePage extends HookWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            AutoRouter.of(context).pop();
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 22,
              vertical: 35,
            ),
            child: Row(
              children: [
                Flexible(
                  child: Text(
                    'Palmas–Brigadeiro Lysias Rodrigues Airport',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                GestureDetector(
                  child: const Icon(
                    Icons.pin_drop_outlined,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(28),
                topRight: Radius.circular(28),
              ),
              child: Container(
                color: Colors.white,
                child: _listViewGenerate(context),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _listViewGenerate(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: List.generate(10, (index) {
        return const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 22,
            vertical: 16,
          ),
          child: FlightCardWidget(),
        );
      }),
    );
  }
}
