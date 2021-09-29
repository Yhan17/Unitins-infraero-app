import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';

import '../../pages/date_trip_picker_page/date_trip_picker_page.dart';
import '../../pages/destiny_airport_page/destiny_airport_page.dart';
import '../../pages/origin_airport_page/origin_airport_page.dart';
import '../../pages/passenger_select_page/passenger_select_page.dart';
import '../../pages/splash/splash_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashPage, initial: true, path: '/'),
    AutoRoute(page: OriginAirportPage, path: '/origin-airport'),
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
  ],
)
class $MobileAppRoute {}
