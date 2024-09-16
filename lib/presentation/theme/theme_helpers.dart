import 'package:flutter/material.dart';
import 'package:hack_yeah_2k24/presentation/theme/app_typography.dart';
import 'package:hack_yeah_2k24/presentation/theme/color_palette.dart';

/// Create a helper extension
/// An extension for theme to get color palette and typography from [BuildContext].
extension ThemeDataExtensions on ThemeData {
  /// The color palette set for the app.
  ColorPalette get colorPalette =>
      extension<ColorPalette>() ?? ColorPalette.lightPalette;

  /// The typography set for the app.
  AppTypography get appTypography =>
      extension<AppTypography>() ?? AppTypography.defaultTypography;

  static ThemeData createThemeData({
    required ColorPalette palette,
    required AppTypography typography,
    required Brightness brightness,
  }) =>
      ThemeData(
        brightness: brightness,
        extensions: {palette, typography},
      );
}

extension BuildContextExt on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorPalette get colorPalette => theme.colorPalette;
  AppTypography get appTypography => theme.appTypography;
}
