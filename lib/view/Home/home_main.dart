import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_baghdad/controller/Network/requestHelper.dart';
import 'package:taxi_baghdad/view/Home/home_dashboard/dashboard_main.dart';
import 'package:taxi_baghdad/view/widgets/custom_text.dart';
import 'package:permission_handler/permission_handler.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  static GoogleMapController? mapController;
  static final Completer<GoogleMapController> _controller = Completer();
  static CameraPosition kGooglePlex = const CameraPosition(
    target: LatLng(39.07357, 105.65766),
    zoom: 14.4746,
  );
  // static final Geolocator geoplocator = Geolocator();
  static Position? currentPosition;

  Future getUserPosition() async {
    await Geolocator.requestPermission().then((value) async {
      
    }).onError((error, stackTrace) {
      print("err");
    });
    Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.bestForNavigation);
      currentPosition = position;

      LatLng mapPos = LatLng(position.latitude, position.longitude);
      print("latitude:${position.latitude}\nlongitude:${position.longitude}");
      String locationAdress = await LocationCalls.reverseGeocode(position);
      print("the adress is $locationAdress");
      CameraPosition cameraPosition = CameraPosition(target: mapPos, zoom: 14);

      mapController!
          .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  void setPermissions() async {
    Map<Permission, PermissionStatus> permissions = await [
      Permission.location,
      Permission.storage
    ].request();
  }

  @override
  Widget build(BuildContext context) {
    setPermissions();
    return Scaffold(
      appBar: AppBar(
        title: Text("main screen"),
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: Column(
              children: [
                ListTile(
                  onTap: () {},
                  title: CustomText(
                    text: "Profile",
                    size: 20,
                  ),
                ),
                ListTile(
                  onTap: () {},
                  title: CustomText(
                    text: "Home",
                    size: 20,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: Stack(children: [
        GoogleMap(
          mapType: MapType.normal,
          myLocationButtonEnabled: true,
          myLocationEnabled: true,
          initialCameraPosition: kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
            mapController = controller;
            getUserPosition().then((value) => print("location => $value"));
          },
        ),
        const Positioned(left: 0, right: 0, bottom: 0, child: Dashboard()),
      ]),
    );
  }
}
