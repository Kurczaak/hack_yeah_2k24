import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

import '../osm_map.dart';

@RoutePage()
class OsmMapPage extends StatelessWidget {
  const OsmMapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OsmMapCubit(),
      child: const OsmMapView(),
    );
  }
}

class OsmMapView extends StatelessWidget {
  const OsmMapView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OsmMapCubit, OsmMapState>(
      builder: (context, state) {
        return const _MapWidget();
      },
    );
  }
}

class _MapWidget extends StatefulWidget {
  const _MapWidget({super.key});

  @override
  State<_MapWidget> createState() => __MapWidgetState();
}

class __MapWidgetState extends State<_MapWidget> {
  MapController mapController = MapController(
    initPosition: GeoPoint(latitude: 52.45, longitude: 21.02),
  );
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      mapController.drawRoadManually([
        GeoPoint(latitude: 52.24, longitude: 21.02),
        GeoPoint(latitude: 52.25, longitude: 21.03),
        GeoPoint(latitude: 52.26, longitude: 21.04),
      ], RoadOption(roadColor: Colors.blue));
      mapController.moveTo(GeoPoint(latitude: 52.45, longitude: 21.02));
    });
  }

  @override
  Widget build(BuildContext context) {
    return OSMFlutter(
        controller: mapController,
        osmOption: OSMOption(
          // userTrackingOption: UserTrackingOption(
          //   enableTracking: true,
          //   unFollowUser: false,
          // ),
          zoomOption: ZoomOption(
            initZoom: 8,
            minZoomLevel: 3,
            maxZoomLevel: 19,
            stepZoom: 1.0,
          ),
          // userLocationMarker: UserLocationMaker(
          //   personMarker: MarkerIcon(
          //     icon: Icon(
          //       Icons.location_history_rounded,
          //       color: Colors.red,
          //       size: 48,
          //     ),
          //   ),
          //   directionArrowMarker: MarkerIcon(
          //     icon: Icon(
          //       Icons.double_arrow,
          //       size: 48,
          //     ),
          //   ),dfksdpfkfkspdfdfsksdpfofopfowerweew
          // ),
          roadConfiguration: RoadOption(
            roadColor: Colors.yellowAccent,
          ),
          // markerOption: MarkerOption(
          //     defaultMarker: MarkerIcon(
          //         icon: Icon(
          //           Icons.person_pin_circle,
          //           color: Colors.blue,
          //           size: 56,
          //         ),
          //     )
          // ),
        ));
  }
}
