import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../core/routes/args/flight_details_args.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_images.dart';
import 'widgets/flight_information_item_widget.dart';
import 'widgets/flight_title_widget.dart';
import 'widgets/passenger_information_widget.dart';

class FlightDetailsPage extends StatelessWidget {
  final FlightDetailsArgs pageArgs;
  const FlightDetailsPage({
    Key? key,
    required this.pageArgs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.primaryColor,
          ),
          onPressed: () {
            AutoRouter.of(context).pop();
          },
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Image.asset(
            AppImages.wing,
          ),
          FlightTitleWidget(
            text: 'De',
            fontSize: 18,
            color: AppColors.neutralGrey,
          ),
          FlightTitleWidget(
            text: pageArgs.originAirportName,
            fontSize: 32,
            color: Colors.black,
          ),
          FlightTitleWidget(
            text: 'Para',
            fontSize: 18,
            color: AppColors.neutralGrey,
          ),
          FlightTitleWidget(
            text: pageArgs.destinyAirportName,
            fontSize: 32,
            color: Colors.black,
          ),
          const SizedBox(
            height: 32,
          ),
          SizedBox(
            height: 125,
            child: ListView.separated(
              padding: const EdgeInsets.only(
                top: 5,
                bottom: 5,
                left: 15,
              ),
              separatorBuilder: (_, index) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  child: SizedBox(
                    width: 30,
                  ),
                );
              },
              physics: const ScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (_, index) {
                return const FlightInformationItemWidget();
              },
            ),
          ),
          const SizedBox(
            height: 36,
          ),
          ListView.separated(
            itemCount: pageArgs.flight.travelerPricings.length,
            shrinkWrap: true, // 1st add
            separatorBuilder: (_, index) {
              return const SizedBox(
                height: 20,
              );
            },
            physics: const ClampingScrollPhysics(), // 2nd add,
            itemBuilder: (_, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15).copyWith(
                  bottom: 10,
                ),
                child: PassengerInformationWidget(
                  code: pageArgs.flight.segments.first.aircraft.code,
                  fareOption:
                      pageArgs.flight.travelerPricings[index].fareOption,
                  total: pageArgs.flight.travelerPricings[index].price,
                  travelerId: pageArgs.flight.travelerPricings[index].travelerId
                      .toString(),
                  travelerType:
                      pageArgs.flight.travelerPricings[index].travelerType,
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
