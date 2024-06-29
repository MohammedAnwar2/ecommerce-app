import 'dart:convert';
import 'package:ecommerce/data/model/routes_model/location_info/location_info.dart';
import 'package:ecommerce/data/model/routes_model/route_modifiers.dart';
import 'package:ecommerce/data/model/routes_model/routes_model.dart';
import 'package:http/http.dart' as http;

class RouteServices {
  final String baseurl =
      "https://routes.googleapis.com/directions/v2:computeRoutes";
  final apiKey = "AIzaSyDupR_hU8trmKUNAyIbdHgEPoXdsVpjty4";
  Future<RoutesModel> postRoutes(
      {required LocationInfo origin,
      required LocationInfo destination,
      RouteModifiers? routeModifiers}) async {
    Uri uri = Uri.parse(baseurl);
    Map<String, String> header = {
      'Content-Type': 'application/json',
      'X-Goog-Api-Key': apiKey,
      'X-Goog-FieldMask':
          'routes.duration,routes.distanceMeters,routes.polyline.encodedPolyline',
    };

    Map<String, dynamic> body = {
      "origin": origin.toJson(),
      "destination": destination.toJson(),
      "travelMode": "DRIVE",
      "routingPreference": "TRAFFIC_AWARE",
      "computeAlternativeRoutes": false,
      "routeModifiers": routeModifiers != null
          ? routeModifiers.toJson()
          : RouteModifiers().toJson(),
      "languageCode": "en-US",
      "units": "IMPERIAL"
    };
    http.Response response =
        await http.post(uri, body: jsonEncode(body), headers: header);
    if (response.statusCode == 200) {
      var responseBody = jsonDecode(response.body);
      return RoutesModel.fromJson(responseBody);
    } else {
      throw Exception();
    }
  }
}
