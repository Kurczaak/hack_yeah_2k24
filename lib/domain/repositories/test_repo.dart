import 'package:hack_yeah_2k24/data/data_source/test_data_source.dart';
import 'package:injectable/injectable.dart';

@injectable
class TestRepo {
  final TestDataSource dataSource;

  TestRepo({required this.dataSource});
  Future<bool> testBackend() => dataSource.test();
}
