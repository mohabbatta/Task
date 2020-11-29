class RoutePath {
  double lat = 30.10213774859951;
  double lng = 31.378939409154555;

  RoutePath({this.lat, this.lng});

  factory RoutePath.fromMap(Map<dynamic, dynamic> value) {
    return RoutePath(
      lat: value['lat'],
      lng: value['lng'],
    );
  }

  Map<dynamic, dynamic> toMap() {
    return <String, dynamic>{
      'lat': lat,
      'lng': lng,
    };
  }
}
