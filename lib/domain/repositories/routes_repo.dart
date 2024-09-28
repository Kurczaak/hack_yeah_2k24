import 'package:hack_yeah_2k24/data/data_source/routes_data_source.dart';
import 'package:hack_yeah_2k24/data/model/response/routes_response_dto.dart';

class RoutesRepo {
  final RoutesDataSource dataSource;

  RoutesRepo({required this.dataSource});
  Future<RoutesResponseDTO> testBackend() => dataSource.getSampleRoute();
}
