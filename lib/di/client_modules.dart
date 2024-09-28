import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hack_yeah_2k24/data/client/test_client.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RetrofitInjectableModule {
  @LazySingleton()
  Dio get dio {
    final apiKey = dotenv.get('API_KEY');
    return Dio(
      BaseOptions(
        headers: {'authorization': 'Bearer $apiKey'},
        connectTimeout: const Duration(seconds: 30), // TODO extract
        receiveTimeout: const Duration(seconds: 30), // TODO extract
      ),
    );
  }

  TestClient getService(Dio client) => TestClient(
        client,
      );
}
