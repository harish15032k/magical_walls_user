import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:magical_walls_user/core/base/base_controller.dart';

class LocationAccessController extends BaseController {
  final Completer<GoogleMapController> mapController =
      Completer<GoogleMapController>();
  CameraPosition kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  CameraPosition kLake = CameraPosition(
    bearing: 192.8334901395799,
    target: LatLng(37.43296265331129, -122.08832357078792),
    tilt: 59.440717697143555,
    zoom: 19.151926040649414,
  );
  Location location = Location();

  void checkLocationPermissionAndGPS() async {


  }
}
