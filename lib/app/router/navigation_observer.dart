import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class NavigationLogger extends AutoRouterObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    log('[router] New route pushed: ${route.settings.name}');
  }

  // only override to observer tab routes
  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    log('[router] Tab route visited: ${route.name}');
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    log('[router] Tab route re-visited: ${route.name}');
  }
}
