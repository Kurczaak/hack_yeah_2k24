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
  List<LatLngDTO> decodePolyline() {
    List<LatLngDTO> poly = [];
    int index = 0, lat = 0, lng = 0;
    String encoded = encodedPolyline;
    int length = encoded.length;

    while (index < length) {
      // Decode latitude
      int b = 0;
      int shift = 0;
      int result = 0;
      while (true) {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1F) << shift;
        shift += 5;
        if (b < 0x20) break;
      }
      int dlat = (result >> 1) ^ -(result & 1);
      lat += dlat;

      // Decode longitude
      result = 0;
      shift = 0;
      while (true) {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1F) << shift;
        shift += 5;
        if (b < 0x20) break;
      }
      int dlng = (result >> 1) ^ -(result & 1);
      lng += dlng;

      // Add decoded LatLng to the list
      poly.add(LatLngDTO(lat / 1e5, lng / 1e5));
    }

    return poly;
  }
}

class LatLngDTO {
  final double latitude;
  final double longitude;

  LatLngDTO(this.latitude, this.longitude);
}
