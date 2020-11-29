import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:task/models/route_path_model.dart';

abstract class APiBase {
  Future<List<RoutePath>> getData(Map<String, dynamic> jsonData);
}

class APi implements APiBase {
  static List<RoutePath> _path = [];

  @override
  Future<List<RoutePath>> getData(Map<String, dynamic> jsonData) async {
    http.Response response = await http.post(
        "http://inaclick.online/mtc/account/checkCredentials",
        headers: {"Content-Type": "application/json"},
        body: json.encode(jsonData));
    if (response.statusCode == 200) {
      print(response.body);
      print("//////////////////");
      dynamic jsonData = json.decode(response.body);
      List<dynamic> data =
          jsonData["InnerData"]["user"]["bus"]["route"]["routePath"];
      _path = data.map((e) => RoutePath.fromMap(e)).toList();
      print(_path);
      return _path;
    } else {
      throw Exception("Server Error");
    }
  }
}
