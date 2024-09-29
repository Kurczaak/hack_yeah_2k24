import 'package:dio/dio.dart';
import 'package:hack_yeah_2k24/data/config/app_configuration.dart';
import 'package:hack_yeah_2k24/data/model/request/get_route_request.dart';
import 'package:hack_yeah_2k24/data/model/response/routes_response_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'routes_client.g.dart';

@RestApi(
  baseUrl: Config.baseUrl,
)
abstract class RoutesClient {
  factory RoutesClient(Dio dio) = _RoutesClient;

  @GET('/ourRoute')
  Future<RoutesResponseDTO> getSampleRoute();

  @GET('/basicRoute')
  Future<RoutesResponseDTO> getRoute(
      {@Body() required GetRouteRequest request});
}
