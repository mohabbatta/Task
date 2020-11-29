import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:task/api/api.dart';
import 'package:task/common_widgets/platform_alert_dialog.dart';
import 'package:task/models/home_model.dart';
import 'package:task/models/route_path_model.dart';

class HomeBloc {
  final APiBase api;
  HomeBloc({this.api});
  final StreamController<HomeModel> _modelController =
      StreamController<HomeModel>();

  Stream<HomeModel> get modelStream => _modelController.stream;
  HomeModel _model = HomeModel();
  void dispose() {
    _modelController.close();
  }

  void updateWith({List<RoutePath> path}) {
    _model = _model.copyWith(path: path);
    _modelController.add(_model);
  }

  Future<void> getData(Map<String, dynamic> jsonData) async {
    List<RoutePath> list = await api.getData(jsonData);
    updateWith(path: list);
  }

  Future<void> show(BuildContext context) async {
    await PlatformAlertDialog(
      title: 'content',
      cancelActionText: 'Cancel',
    ).show(context);
  }
}
