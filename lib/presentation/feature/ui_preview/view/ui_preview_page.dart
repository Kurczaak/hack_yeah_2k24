import 'dart:math' as math;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hack_yeah_2k24/presentation/common/components/button.dart';
import 'package:hack_yeah_2k24/presentation/common/components/text.dart';
import 'package:hack_yeah_2k24/presentation/feature/theme_switcher/cubit/theme_switcher_cubit.dart';
import 'package:hack_yeah_2k24/presentation/feature/ui_preview/view/animations_preview.dart';
import 'package:hack_yeah_2k24/presentation/feature/ui_preview/view/buttons_preview.dart';
import 'package:hack_yeah_2k24/presentation/feature/ui_preview/view/color_palette_preview.dart';
import 'package:hack_yeah_2k24/presentation/feature/ui_preview/view/text_fields_preview.dart';
import 'package:hack_yeah_2k24/presentation/feature/ui_preview/view/typography_preview.dart';
import 'package:hack_yeah_2k24/presentation/theme/theme_helpers.dart';

@RoutePage()
class UiPreviewPage extends StatelessWidget {
  const UiPreviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const UiPreviewView();
  }
}

class UiPreviewView extends StatelessWidget {
  const UiPreviewView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    const animationPreview =
        AnimationsPreview(key: GlobalObjectKey('AnimationsPreview'));
    final brightness = context.brightness;

    return Scaffold(
      backgroundColor: context.colorPalette.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: context.colorPalette.background,
            surfaceTintColor: context.colorPalette.background,
            pinned: true,
            actions: [
              UiButton.icon(
                icon: brightness == Brightness.light
                    ? const Icon(Icons.dark_mode_rounded)
                    : const Icon(Icons.light_mode_rounded),
                onPressed: () => _handleOnThemeSwitch(context),
              ),
            ],
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(
              horizontal: math.max((size.width - 900) / 2, 16),
              vertical: 24,
            ),
            sliver: SliverList.list(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: UiText.titleLarge('Color Palette'),
                ),
                const SizedBox(height: 8),
                const ColorPalettePreview(),
                const SizedBox(height: 24),
                Align(
                  alignment: Alignment.center,
                  child: UiText.titleLarge('Typography'),
                ),
                const TypographyPreview(),
                const SizedBox(height: 24),
                Align(
                  alignment: Alignment.center,
                  child: UiText.titleLarge('Buttons'),
                ),
                const SizedBox(height: 8),
                const ButtonsPreview(),
                const SizedBox(height: 24),
                Align(
                  alignment: Alignment.center,
                  child: UiText.titleLarge('Text Inputs'),
                ),
                const SizedBox(height: 8),
                const TextFieldsPreview(),
                const SizedBox(height: 24),
                Align(
                  alignment: Alignment.center,
                  child: UiText.titleLarge('Animations'),
                ),
                const SizedBox(height: 8),
                animationPreview,
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _handleOnThemeSwitch(BuildContext context) =>
      context.read<ThemeSwitcherCubit>().toggleTheme();
}
