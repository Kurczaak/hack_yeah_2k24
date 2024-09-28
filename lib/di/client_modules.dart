import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hack_yeah_2k24/data/client/routes_client.dart';
import 'package:hack_yeah_2k24/data/client/routes_client.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RetrofitInjectableModule {
  RoutesClient getService(Dio client) => RoutesClient(
        client,
      );
}
