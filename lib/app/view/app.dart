import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hack_yeah_2k24/app/router/navigation_observer.dart';
import 'package:hack_yeah_2k24/app/router/router.dart';
import 'package:hack_yeah_2k24/l10n/l10n.dart';
import 'package:hack_yeah_2k24/presentation/theme/app_typography.dart';
import 'package:hack_yeah_2k24/presentation/theme/color_palette.dart';
import 'package:hack_yeah_2k24/presentation/theme/theme_helpers.dart';

class App extends StatelessWidget {
  App({super.key});

  final _appRouter = AppRouter();

  final ligthTheme = ThemeDataExtensions.createThemeData(
    palette: ColorPalette.lightPalette,
    typography: AppTypography.defaultTypography,
    brightness: Brightness.light,
  );

  final darkTheme = ThemeDataExtensions.createThemeData(
    palette: ColorPalette.darkPalette,
    typography: AppTypography.defaultTypography,
    brightness: Brightness.dark,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ligthTheme,
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
