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

extension PolylineDTOExtension on PolylineDTO {
  List<LatLngDTO> decodePolyline(String encoded) {
    List<LatLngDTO> points = [];
    int index = 0, len = encoded.length;
    int lat = 0, lng = 0;
    BigInt big0 = BigInt.from(0);
    BigInt big0x1f = BigInt.from(0x1f);
    BigInt big0x20 = BigInt.from(0x20);

    while (index < len) {
      int shift = 0;
      BigInt b, result;
      result = big0;
      do {
        b = BigInt.from(encoded.codeUnitAt(index++) - 63);
        result |= (b & big0x1f) << shift;
        shift += 5;
      } while (b >= big0x20);
      BigInt rShifted = result >> 1;
      int dLat;
      if (result.isOdd)
        dLat = (~rShifted).toInt();
      else
        dLat = rShifted.toInt();
      lat += dLat;

      shift = 0;
      result = big0;
      do {
        b = BigInt.from(encoded.codeUnitAt(index++) - 63);
        result |= (b & big0x1f) << shift;
        shift += 5;
      } while (b >= big0x20);
      rShifted = result >> 1;
      int dLng;
      if (result.isOdd)
        dLng = (~rShifted).toInt();
      else
        dLng = rShifted.toInt();
      lng += dLng;

      points.add(LatLngDTO((lat / 1E5).toDouble(), (lng / 1E5).toDouble()));
    }

    return points;
  }
}

class LatLngDTO {
  final double latitude;
  final double longitude;

  LatLngDTO(this.latitude, this.longitude);
}
