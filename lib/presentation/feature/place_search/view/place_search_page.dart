import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../place_search.dart';

class PlaceSearchPage extends StatelessWidget {
  const PlaceSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PlaceSearchCubit(),
      child: const PlaceSearchView(),
    );
  }
}

class PlaceSearchView extends StatelessWidget {
  const PlaceSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlaceSearchCubit, PlaceSearchState>(
      builder: (context, state) {
        // TODO: return correct widget based on the state.
        return const SizedBox();
      },
    );
  }
}
