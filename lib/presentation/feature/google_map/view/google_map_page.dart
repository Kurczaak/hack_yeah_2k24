import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../google_map.dart';

@RoutePage()
class GoogleMapPage extends StatelessWidget {
  const GoogleMapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GoogleMapCubit(),
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
        return _MapWidget();
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
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(target: LatLng(52.24, 21.02)),
      // padding: const EdgeInsets.only(
      //   bottom: AppDimens.rangeSectionHeight,
      //   top: AppDimens.horizontalPadding,
      // ),
      // initialCameraPosition:
      //     MapConstants.defaultLocation.toCameraPosition(),
      myLocationEnabled: true,
      polylines: {},
      onMapCreated: mapController.complete,
      // markers: markers,
      // circles: !kDebugMode
      //     ? {}
      //     : {
      //         center,
      //       },
      // onCameraMove: onCameraMove,
    );
  }
}
