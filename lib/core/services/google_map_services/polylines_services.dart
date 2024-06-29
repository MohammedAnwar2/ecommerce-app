import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/services/google_map_services/location_services.dart';
import 'package:ecommerce/core/services/google_map_services/routes_maps_services.dart';
import 'package:ecommerce/data/model/routes_model/location_info/lat_lng.dart';
import 'package:ecommerce/data/model/routes_model/location_info/location.dart';
import 'package:ecommerce/data/model/routes_model/location_info/location_info.dart';
import 'package:ecommerce/data/model/routes_model/routes_model.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PolyLinceServices {
  LocationService locationService = LocationService();
  RouteServices routeServices = RouteServices();

  Future<List<LatLng>> getRoutesData(
      {required LatLng distenationLocation,
      required LatLng currentLocation}) async {
    LocationInfo origin = LocationInfo(
      location: LocationModel(
        latLng: LatLngModel(
          latitude: currentLocation.latitude,
          longitude: currentLocation.longitude,
        ),
      ),
    );
    LocationInfo distenation = LocationInfo(
      location: LocationModel(
        latLng: LatLngModel(
          latitude: distenationLocation.latitude,
          longitude: distenationLocation.longitude,
        ),
      ),
    );
    RoutesModel routesData = await routeServices.postRoutes(
        origin: origin, destination: distenation);
    PolylinePoints polylinePoints = PolylinePoints();
    List<LatLng> points = getDecodedRoute(polylinePoints, routesData);
    return points;
  }

  List<LatLng> getDecodedRoute(
      PolylinePoints polylinePoints, RoutesModel routesData) {
    List<PointLatLng> result = polylinePoints.decodePolyline(
      routesData.routes!.first.polyline!.encodedPolyline!,
    );
    List<LatLng> points =
        result.map((e) => LatLng(e.latitude, e.longitude)).toList();
    return points;
  }

  void displayPolyLines({
    required List<LatLng> points,
    required Set<Polyline> polyLines,
  }) {
    Polyline route = Polyline(
      polylineId: const PolylineId("poly"),
      points: points,
      color: AppColor.primaryColor,
      width: 5,
    );
    polyLines.add(route);
  }
}
