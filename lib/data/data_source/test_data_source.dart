import 'package:hack_yeah_2k24/data/client/test_client.dart';
import 'package:hack_yeah_2k24/data/model/request/test_request.dart';
import 'package:injectable/injectable.dart';

@injectable
class TestDataSource {
  final TestClient client;

  TestDataSource({required this.client});
  Future<bool> test() async {
    final response = await client.test(TestRequest(param: 'test'));
    return response.data.isNotEmpty;
  }
}
