// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../../pages/flight_details/flight_details_page.dart' as _i9;
import '../../pages/form_steps/date_trip_picker_page/date_trip_picker_page.dart'
    as _i6;
import '../../pages/form_steps/destiny_airport_page/destiny_airport_page.dart'
    as _i5;
import '../../pages/form_steps/origin_airport_page/origin_airport_page.dart'
    as _i4;
import '../../pages/form_steps/passenger_select_page/passenger_select_page.dart'
    as _i7;
import '../../pages/home/home_page.dart' as _i8;
import '../../pages/splash/splash_page.dart' as _i3;
import 'args/date_trip_picker_args.dart' as _i11;
import 'args/destiny_airport_args.dart' as _i10;
import 'args/flight_details_args.dart' as _i14;
import 'args/home_args.dart' as _i13;
import 'args/passenger_select_args.dart' as _i12;

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
      return _i1.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i4.OriginAirportPage(),
          transitionsBuilder: _i1.TransitionsBuilders.slideLeft,
          durationInMilliseconds: 400,
          opaque: true,
          barrierDismissible: false);
    },
    DestinyAirportRoute.name: (routeData) {
      final args = routeData.argsAs<DestinyAirportRouteArgs>();
      return _i1.CustomPage<dynamic>(
          routeData: routeData,
          child: _i5.DestinyAirportPage(key: args.key, args: args.args),
          transitionsBuilder: _i1.TransitionsBuilders.slideLeft,
          durationInMilliseconds: 400,
          opaque: true,
          barrierDismissible: false);
    },
    DateTripPickerRoute.name: (routeData) {
      final args = routeData.argsAs<DateTripPickerRouteArgs>();
      return _i1.CustomPage<dynamic>(
          routeData: routeData,
          child: _i6.DateTripPickerPage(key: args.key, pageArgs: args.pageArgs),
          transitionsBuilder: _i1.TransitionsBuilders.slideLeft,
          durationInMilliseconds: 400,
          opaque: true,
          barrierDismissible: false);
    },
    PassengerSelectRoute.name: (routeData) {
      final args = routeData.argsAs<PassengerSelectRouteArgs>();
      return _i1.CustomPage<dynamic>(
          routeData: routeData,
          child:
              _i7.PassengerSelectPage(key: args.key, pageArgs: args.pageArgs),
          transitionsBuilder: _i1.TransitionsBuilders.slideLeft,
          durationInMilliseconds: 400,
          opaque: true,
          barrierDismissible: false);
    },
    HomeRoute.name: (routeData) {
      final args = routeData.argsAs<HomeRouteArgs>();
      return _i1.CustomPage<dynamic>(
          routeData: routeData,
          child: _i8.HomePage(key: args.key, pageArgs: args.pageArgs),
          transitionsBuilder: _i1.TransitionsBuilders.slideTop,
          durationInMilliseconds: 400,
          opaque: true,
          barrierDismissible: false);
    },
    FlightDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<FlightDetailsRouteArgs>();
      return _i1.CustomPage<dynamic>(
          routeData: routeData,
          child: _i9.FlightDetailsPage(key: args.key, pageArgs: args.pageArgs),
          transitionsBuilder: _i1.TransitionsBuilders.slideTop,
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
        _i1.RouteConfig(PassengerSelectRoute.name, path: '/passenger-select'),
        _i1.RouteConfig(HomeRoute.name, path: '/home'),
        _i1.RouteConfig(FlightDetailsRoute.name, path: '/flight-detail')
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

class DestinyAirportRoute extends _i1.PageRouteInfo<DestinyAirportRouteArgs> {
  DestinyAirportRoute({_i2.Key? key, required _i10.DestinyAirportArgs args})
      : super(name,
            path: '/destiny-airport',
            args: DestinyAirportRouteArgs(key: key, args: args));

  static const String name = 'DestinyAirportRoute';
}

class DestinyAirportRouteArgs {
  const DestinyAirportRouteArgs({this.key, required this.args});

  final _i2.Key? key;

  final _i10.DestinyAirportArgs args;
}

class DateTripPickerRoute extends _i1.PageRouteInfo<DateTripPickerRouteArgs> {
  DateTripPickerRoute({_i2.Key? key, required _i11.DateTripPickerArgs pageArgs})
      : super(name,
            path: '/date-picker',
            args: DateTripPickerRouteArgs(key: key, pageArgs: pageArgs));

  static const String name = 'DateTripPickerRoute';
}

class DateTripPickerRouteArgs {
  const DateTripPickerRouteArgs({this.key, required this.pageArgs});

  final _i2.Key? key;

  final _i11.DateTripPickerArgs pageArgs;
}

class PassengerSelectRoute extends _i1.PageRouteInfo<PassengerSelectRouteArgs> {
  PassengerSelectRoute(
      {_i2.Key? key, required _i12.PassengerSelectArgs pageArgs})
      : super(name,
            path: '/passenger-select',
            args: PassengerSelectRouteArgs(key: key, pageArgs: pageArgs));

  static const String name = 'PassengerSelectRoute';
}

class PassengerSelectRouteArgs {
  const PassengerSelectRouteArgs({this.key, required this.pageArgs});

  final _i2.Key? key;

  final _i12.PassengerSelectArgs pageArgs;
}

class HomeRoute extends _i1.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({_i2.Key? key, required _i13.HomeArgs pageArgs})
      : super(name,
            path: '/home', args: HomeRouteArgs(key: key, pageArgs: pageArgs));

  static const String name = 'HomeRoute';
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key, required this.pageArgs});

  final _i2.Key? key;

  final _i13.HomeArgs pageArgs;
}

class FlightDetailsRoute extends _i1.PageRouteInfo<FlightDetailsRouteArgs> {
  FlightDetailsRoute({_i2.Key? key, required _i14.FlightDetailsArgs pageArgs})
      : super(name,
            path: '/flight-detail',
            args: FlightDetailsRouteArgs(key: key, pageArgs: pageArgs));

  static const String name = 'FlightDetailsRoute';
}

class FlightDetailsRouteArgs {
  const FlightDetailsRouteArgs({this.key, required this.pageArgs});

  final _i2.Key? key;

  final _i14.FlightDetailsArgs pageArgs;
}
