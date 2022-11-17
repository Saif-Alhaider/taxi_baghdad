import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class RequestHelper {
  static Future<dynamic> getRequest(String url) async {
    http.Response response = await http.get(Uri.parse(url));
    try {
      if (response.statusCode == 200) return jsonDecode(response.body);
      else return 'failed';
    } catch (e) {
      return 'failed';
    }
  }
}

class LocationCalls {
  static Future<String> reverseGeocode(Position position) async {
    String? placeAdress;

    ConnectivityResult connectivityResult =
        await Connectivity().checkConnectivity();
    if (connectivityResult != ConnectivityResult.mobile &&
        connectivityResult != ConnectivityResult.wifi) return placeAdress = '';

    final String geoUrl =
        "https://geocode.arcgis.com/arcgis/rest/services/World/GeocodeServer/reverseGeocode?f=pjson&featureTypes=&location=${position.latitude}%2C${position.longitude}";
    var response = await RequestHelper.getRequest(geoUrl);
    
    return response["address"]["LongLabel"];
  }
}
