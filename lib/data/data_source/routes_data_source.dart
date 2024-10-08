import 'package:hack_yeah_2k24/data/client/routes_client.dart';
import 'package:hack_yeah_2k24/data/model/request/get_route_request.dart';
import 'package:hack_yeah_2k24/data/model/response/routes_response_dto.dart';
import 'package:injectable/injectable.dart';

@injectable
class RoutesDataSource {
  final RoutesClient client;

  RoutesDataSource({required this.client});
  Future<RoutesResponseDTO> getSampleRoute() async {
    final response = await client.getSampleRoute();
    return response;
  }

  Future<RoutesResponseDTO> getRoute({
    required String startPlaceId,
    required String destPlaceId,
  }) async {
    final response = await client.getRoute(
      request: GetRouteRequest(
        startPlaceId: startPlaceId,
        destPlaceId: destPlaceId,
      ),
    );
    return response;
  }
}
