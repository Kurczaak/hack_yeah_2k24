import 'package:dio/dio.dart';
import 'package:hack_yeah_2k24/data/config/config.dart';
import 'package:hack_yeah_2k24/data/model/request/test_request.dart';
import 'package:hack_yeah_2k24/data/model/response/test_response_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'test_client.g.dart';

@RestApi()
abstract class TestClient {
  factory TestClient(Dio dio) = _TestClient;

  @POST('${Config.baseUrl}/sample_route')
  Future<TestResponseDTO> test(@Body() TestRequest body);
}
