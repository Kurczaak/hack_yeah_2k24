import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'osm_map_state.dart';
part 'osm_map_cubit.freezed.dart';

class OsmMapCubit extends Cubit<OsmMapState> {
  OsmMapCubit() : super(const OsmMapState.initial());
}
