import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_search_state.dart';
part 'place_search_cubit.freezed.dart';

class PlaceSearchCubit extends Cubit<PlaceSearchState> {
  PlaceSearchCubit() : super(const PlaceSearchState.initial());
}
