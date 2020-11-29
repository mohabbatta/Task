import 'package:task/models/route_path_model.dart';

class HomeModel {
  List<RoutePath> path = [];
  HomeModel({this.path});

  HomeModel copyWith({List<RoutePath> path}) {
    return HomeModel(path: path ?? this.path);
  }
}
