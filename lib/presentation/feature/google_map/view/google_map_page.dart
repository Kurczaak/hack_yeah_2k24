import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hack_yeah_2k24/app/router/router.gr.dart';
import 'package:hack_yeah_2k24/data/model/response/polyline_dto.dart';
import 'package:hack_yeah_2k24/di/injection.dart';
import 'package:hack_yeah_2k24/domain/repositories/routes_repo.dart';
import '../google_map.dart';

@RoutePage()
class GoogleMapPage extends StatelessWidget {
  const GoogleMapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<GoogleMapCubit>()..fetchPolyline(),
      child: const GoogleMapView(),
    );
  }
}

class GoogleMapView extends StatelessWidget {
  const GoogleMapView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GoogleMapCubit, GoogleMapState>(
      builder: (context, state) {
        return const _MapWidget();
      },
    );
  }
}

class _MapWidget extends StatefulWidget {
  const _MapWidget();

  @override
  State<_MapWidget> createState() => __MapWidgetState();
}

class __MapWidgetState extends State<_MapWidget> {
  final Completer<GoogleMapController> mapController =
      Completer<GoogleMapController>();

  Set<Polyline> _polylines = {}; // Set to hold the polyline

  @override
  Widget build(BuildContext context) {
    return BlocListener<GoogleMapCubit, GoogleMapState>(
      listener: (context, state) {
        state.map(
            initial: (_) {},
            loading: (_) {},
            loaded: (state) {
              setState(() {
                _polylines = {state.polylineItem};
              });
            });
      },
      child: GoogleMap(
        zoomControlsEnabled: true,
        initialCameraPosition: CameraPosition(target: LatLng(52.24, 21.02)),
        myLocationEnabled: true,
        polylines: _polylines,
        onMapCreated: mapController.complete,
      ),
    );
  }
}
