import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import '../../pages/flight_details/flight_details_page.dart';
import '../../pages/home/home_page.dart';

import '../../pages/form_steps/date_trip_picker_page/date_trip_picker_page.dart';
import '../../pages/form_steps/destiny_airport_page/destiny_airport_page.dart';
import '../../pages/form_steps/origin_airport_page/origin_airport_page.dart';
import '../../pages/form_steps/passenger_select_page/passenger_select_page.dart';
import '../../pages/splash/splash_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: SplashPage,
      path: '/',
      initial: true,
    ),
    CustomRoute(
      page: OriginAirportPage,
      path: '/origin-airport',
      transitionsBuilder: TransitionsBuilders.slideLeft,
      durationInMilliseconds: 400,
    ),
    CustomRoute(
      page: DestinyAirportPage,
      path: '/destiny-airport',
      transitionsBuilder: TransitionsBuilders.slideLeft,
      durationInMilliseconds: 400,
    ),
    CustomRoute(
      page: DateTripPickerPage,
      path: '/date-picker',
      transitionsBuilder: TransitionsBuilders.slideLeft,
      durationInMilliseconds: 400,
    ),
    CustomRoute(
      page: PassengerSelectPage,
      path: '/passenger-select',
      transitionsBuilder: TransitionsBuilders.slideLeft,
      durationInMilliseconds: 400,
    ),
    CustomRoute(
      page: HomePage,
      path: '/home',
      transitionsBuilder: TransitionsBuilders.slideTop,
      durationInMilliseconds: 400,
    ),
    CustomRoute(
      page: FlightDetailsPage,
      path: '/flight-detail',
      transitionsBuilder: TransitionsBuilders.slideTop,
      durationInMilliseconds: 400,
    ),
  ],
)
class $MobileAppRoute {}
