import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_baghdad/view/Home/home_dashboard/dashboard_main.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  static GoogleMapController? mapController;
  static final Completer<GoogleMapController> _controller = Completer();
  static CameraPosition kGooglePlex = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("main screen"),
      ),
      body: Stack(children: [
        GoogleMap(
              mapType: MapType.normal,
              myLocationButtonEnabled: true,
              initialCameraPosition: kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
                mapController = controller;
              },
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
                child: Dashboard()),
      ]),
    );
  }
}
