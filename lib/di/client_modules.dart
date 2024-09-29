import 'package:dio/dio.dart';
import 'package:hack_yeah_2k24/data/client/places_client.dart';
import 'package:hack_yeah_2k24/data/client/routes_client.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RetrofitInjectableModule {
  RoutesClient getRoutesClient(Dio client) => RoutesClient(
        client,
      );
  PlacesClient getPlacesClient(Dio client) => PlacesClient(
        client,
      );
}
