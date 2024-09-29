import 'package:hack_yeah_2k24/data/client/places_client.dart';
import 'package:hack_yeah_2k24/data/model/response/place/place_predictions_response_dto.dart';
import 'package:hack_yeah_2k24/domain/model/place_prediction_request.dart';
import 'package:injectable/injectable.dart';

@injectable
class PlacesDataSource {
  final PlacesClient client;

  PlacesDataSource({required this.client});

  Future<PredictionsResponseDTO> getPlacePredictions(
      PlacePredictionRequest request) async {
    return client.getPredictions(
      input: request.text,
      key: 'AIzaSyDQOh7v_Y0zz64NKkVGvJFV03gbFaV8ZwE',
      location: '${request.latitude},${request.longitude}',
      radius: request.radius.toInt(),
    );
  }
}
