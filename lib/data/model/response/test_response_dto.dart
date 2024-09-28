import 'package:freezed_annotation/freezed_annotation.dart';

part 'test_response_dto.g.dart';

@JsonSerializable()
class TestResponseDTO {
  final String data;

  TestResponseDTO({
    required this.data,
  });

  factory TestResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$TestResponseDTOFromJson(json);

  Map<String, dynamic> toJson() => _$TestResponseDTOToJson(this);
}
