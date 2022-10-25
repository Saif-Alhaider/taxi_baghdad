import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_baghdad/view/Home/home_dashboard/dashboard_main.dart';
import 'package:taxi_baghdad/view/widgets/custom_text.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  static GoogleMapController? mapController;
  static final Completer<GoogleMapController> _controller = Completer();
  static CameraPosition kGooglePlex = const CameraPosition(
    target: LatLng(33.234269, 44.334756),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("main screen"),
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: Column(
              children: [
                ListTile(
                  onTap: (){},
                  title: CustomText(text: "Profile",size: 20,),
                ),
                ListTile(
                  onTap: (){},
                  title: CustomText(text: "Home",size: 20,),
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
          },
        ),
        const Positioned(left: 0, right: 0, bottom: 0, child: Dashboard()),
      ]),
    );
  }
}
