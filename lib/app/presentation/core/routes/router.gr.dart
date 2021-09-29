// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../../pages/date_trip_picker_page/date_trip_picker_page.dart' as _i6;
import '../../pages/destiny_airport_page/destiny_airport_page.dart' as _i5;
import '../../pages/origin_airport_page/origin_airport_page.dart' as _i4;
import '../../pages/passenger_select_page/passenger_select_page.dart' as _i7;
import '../../pages/splash/splash_page.dart' as _i3;

class MobileAppRoute extends _i1.RootStackRouter {
  MobileAppRoute([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.SplashPage());
    },
    OriginAirportRoute.name: (routeData) {
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.OriginAirportPage());
    },
    DestinyAirportRoute.name: (routeData) {
      return _i1.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i5.DestinyAirportPage(),
          transitionsBuilder: _i1.TransitionsBuilders.slideLeft,
          durationInMilliseconds: 400,
          opaque: true,
          barrierDismissible: false);
    },
    DateTripPickerRoute.name: (routeData) {
      return _i1.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i6.DateTripPickerPage(),
          transitionsBuilder: _i1.TransitionsBuilders.slideLeft,
          durationInMilliseconds: 400,
          opaque: true,
          barrierDismissible: false);
    },
    PassengerSelectRoute.name: (routeData) {
      return _i1.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i7.PassengerSelectPage(),
          transitionsBuilder: _i1.TransitionsBuilders.slideLeft,
          durationInMilliseconds: 400,
          opaque: true,
          barrierDismissible: false);
    }
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(SplashRoute.name, path: '/'),
        _i1.RouteConfig(OriginAirportRoute.name, path: '/origin-airport'),
        _i1.RouteConfig(DestinyAirportRoute.name, path: '/destiny-airport'),
        _i1.RouteConfig(DateTripPickerRoute.name, path: '/date-picker'),
        _i1.RouteConfig(PassengerSelectRoute.name, path: '/passenger-select')
      ];
}

class SplashRoute extends _i1.PageRouteInfo<void> {
  const SplashRoute() : super(name, path: '/');

  static const String name = 'SplashRoute';
}

class OriginAirportRoute extends _i1.PageRouteInfo<void> {
  const OriginAirportRoute() : super(name, path: '/origin-airport');

  static const String name = 'OriginAirportRoute';
}

class DestinyAirportRoute extends _i1.PageRouteInfo<void> {
  const DestinyAirportRoute() : super(name, path: '/destiny-airport');

  static const String name = 'DestinyAirportRoute';
}

class DateTripPickerRoute extends _i1.PageRouteInfo<void> {
  const DateTripPickerRoute() : super(name, path: '/date-picker');

  static const String name = 'DateTripPickerRoute';
}

class PassengerSelectRoute extends _i1.PageRouteInfo<void> {
  const PassengerSelectRoute() : super(name, path: '/passenger-select');

  static const String name = 'PassengerSelectRoute';
}
