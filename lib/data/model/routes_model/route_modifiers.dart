class RouteModifiers {
  bool? avoidTolls;
  bool? avoidHighways;
  bool? avoidFerries;

  RouteModifiers(
      {this.avoidTolls = false,
      this.avoidHighways = false,
      this.avoidFerries = false});

  factory RouteModifiers.fromJson(Map<String, dynamic> json) {
    return RouteModifiers(
      avoidTolls: json['avoidTolls'] as bool?,
      avoidHighways: json['avoidHighways'] as bool?,
      avoidFerries: json['avoidFerries'] as bool?,
    );
  }

  Map<String, dynamic> toJson() => {
        'avoidTolls': avoidTolls,
        'avoidHighways': avoidHighways,
        'avoidFerries': avoidFerries,
      };
}
