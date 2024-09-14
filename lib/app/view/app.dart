import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hack_yeah_2k24/app/router/navigation_observer.dart';
import 'package:hack_yeah_2k24/app/router/router.dart';
import 'package:hack_yeah_2k24/l10n/l10n.dart';

class App extends StatelessWidget {
  App({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        useMaterial3: true,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: _appRouter.config(
        navigatorObservers: () => [NavigationLogger()],
        deepLinkBuilder: (deepLink) {
          if (kIsWeb) {
            return deepLink;
          }
          if (deepLink.uri.fragment == '/' || deepLink.uri.fragment.isEmpty) {
            return DeepLink.defaultPath;
          }
          return DeepLink.path(deepLink.uri.fragment);
        },
      ),
    );
  }
}
