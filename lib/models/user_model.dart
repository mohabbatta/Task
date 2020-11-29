import 'package:flutter/material.dart';

class User {
  String name;
  String password;
  String deviceToken;

  User({@required this.name, @required this.password, this.deviceToken});

  factory User.fromMap(Map<dynamic, dynamic> value) {
    return User(
      name: value['name'],
      password: value['password'],
      deviceToken: value['deviceToken'],
    );
  }

  Map<dynamic, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'password': password,
      'deviceToken': deviceToken,
    };
  }
}
