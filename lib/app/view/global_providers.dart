import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hack_yeah_2k24/presentation/feature/filters/filters.dart';
import 'package:hack_yeah_2k24/presentation/feature/theme_switcher/cubit/theme_switcher_cubit.dart';

class GlobalProviders extends StatelessWidget {
  const GlobalProviders({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeSwitcherCubit()),
        BlocProvider(create: (context) => FiltersCubit()),
      ],
      child: child,
    );
  }
}
