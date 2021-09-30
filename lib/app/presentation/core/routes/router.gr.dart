// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../../pages/flight_details/flight_details_page.dart' as _i4;
import '../../pages/home/home_page.dart' as _i3;

class MobileAppRoute extends _i1.RootStackRouter {
  MobileAppRoute([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i1.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i3.HomePage(),
          transitionsBuilder: _i1.TransitionsBuilders.slideTop,
          durationInMilliseconds: 400,
          opaque: true,
          barrierDismissible: false);
    },
    FlightDetailsRoute.name: (routeData) {
      return _i1.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i4.FlightDetailsPage(),
          transitionsBuilder: _i1.TransitionsBuilders.slideTop,
          durationInMilliseconds: 400,
          opaque: true,
          barrierDismissible: false);
    }
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig('/#redirect',
            path: '/', redirectTo: '/home', fullMatch: true),
        _i1.RouteConfig(HomeRoute.name, path: '/home'),
        _i1.RouteConfig(FlightDetailsRoute.name, path: '/flight-detail')
      ];
}

class HomeRoute extends _i1.PageRouteInfo<void> {
  const HomeRoute() : super(name, path: '/home');

  static const String name = 'HomeRoute';
}

class FlightDetailsRoute extends _i1.PageRouteInfo<void> {
  const FlightDetailsRoute() : super(name, path: '/flight-detail');

  static const String name = 'FlightDetailsRoute';
}
