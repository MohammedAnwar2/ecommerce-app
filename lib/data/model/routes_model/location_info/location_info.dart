import 'location.dart';

class LocationInfo {
  LocationModel? location;

  LocationInfo({this.location});

  factory LocationInfo.fromJson(Map<String, dynamic> json) => LocationInfo(
        location: json['location'] == null
            ? null
            : LocationModel.fromJson(json['location'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'location': location?.toJson(),
      };
}
