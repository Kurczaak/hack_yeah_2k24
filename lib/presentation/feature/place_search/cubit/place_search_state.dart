part of 'place_search_cubit.dart';

@freezed
class PlaceSearchState with _$PlaceSearchState {
  const factory PlaceSearchState.initial() = _Initial;
  const factory PlaceSearchState.loading() = _Loading;
  const factory PlaceSearchState.loaded(
    List<PlacePrediction> predictions,
  ) = _Loaded;
}
