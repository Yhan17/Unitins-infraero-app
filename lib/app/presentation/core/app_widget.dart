import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'routes/router.gr.dart';
import 'theme/app_theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _rootRouter = MobileAppRoute();

    return ProviderScope(
      child: MaterialApp.router(
        title: 'Infraero',
        theme: theme,
        debugShowCheckedModeBanner: false,
        routeInformationParser: _rootRouter.defaultRouteParser(),
        routerDelegate: AutoRouterDelegate(_rootRouter),
      ),
    );
  }
}
