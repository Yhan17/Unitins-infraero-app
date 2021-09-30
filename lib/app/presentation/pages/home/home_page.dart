import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infraero/app/presentation/core/routes/args/home_args.dart';

import '../../core/theme/app_colors.dart';
import 'widgets/flight_card_widget.dart';

class HomePage extends HookWidget {
  final HomeArgs pageArgs;
  const HomePage({
    Key? key,
    required this.pageArgs,
  }) : super(key: key);

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
                    pageArgs.origin.name,
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
    return ListView.separated(
      separatorBuilder: (_, index) {
        return const SizedBox(
          height: 20,
        );
      },
      shrinkWrap: true,
      itemCount: pageArgs.flights.length,
      itemBuilder: (_, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22)
              .copyWith(top: index == 0 ? 30 : null),
          child: FlightCardWidget(
            destinyCity: pageArgs.destiny.county,
            destinyIata: pageArgs.destiny.iata,
            flight: pageArgs.flights[index],
            originCity: pageArgs.origin.county,
            originIata: pageArgs.origin.iata,
          ),
        );
      },
    );
  }
}
