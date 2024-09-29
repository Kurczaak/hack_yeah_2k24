part of 'google_map_cubit.dart';

@freezed
class GoogleMapState with _$GoogleMapState {
  const factory GoogleMapState.initial() = _Initial;
  const factory GoogleMapState.loading() = _Loading;
  const factory GoogleMapState.loaded({required Polyline polylineItem}) =
      _Loaded;
}
