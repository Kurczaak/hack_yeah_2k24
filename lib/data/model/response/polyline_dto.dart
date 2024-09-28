import 'package:freezed_annotation/freezed_annotation.dart';

part 'polyline_dto.g.dart';

@JsonSerializable()
class PolylineDTO {
  final String encodedPolyline;

  PolylineDTO({required this.encodedPolyline});

  factory PolylineDTO.fromJson(Map<String, dynamic> json) =>
      _$PolylineDTOFromJson(json);
  Map<String, dynamic> toJson() => _$PolylineDTOToJson(this);
}
