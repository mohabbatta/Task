import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/api/api.dart';
import 'package:task/landing.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<APiBase>(
      create: (context) => APi(),
      child: MaterialApp(
        title: 'Flutter',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Landing(),
      ),
    );
  }
}
