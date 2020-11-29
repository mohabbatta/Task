import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:task/blocs/home_bloc.dart';
import 'package:task/models/home_model.dart';
import 'package:task/models/route_path_model.dart';
import 'package:task/models/user_model.dart';

class Home extends StatefulWidget {
  final HomeBloc bloc;
  const Home({Key key, @required this.bloc}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    var user = User(name: 'bola_d', password: '1234', deviceToken: "");
    widget.bloc.getData(user.toMap());
    super.initState();
  }

  Completer<GoogleMapController> _controller = Completer();
  List<Polyline> myLine = [];

  createPolyLine(List<RoutePath> list) {
    var myPoints = list.map((e) => LatLng(e.lat, e.lng)).toList();
    myLine.add(Polyline(
      polylineId: PolylineId('1'),
      color: Colors.blue,
      width: 5,
      points: myPoints,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<HomeModel>(
          stream: widget.bloc.modelStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final data = snapshot.data;
              createPolyLine(data.path);
              print(data.path);
              return Stack(
                children: [
                  GoogleMap(
                    mapType: MapType.hybrid,
                    initialCameraPosition: CameraPosition(
                        target: LatLng(
                          30.10213774859951,
                          31.378939409154555,
                        ),
                        zoom: 15,
                        bearing: 5),
                    polylines: myLine.toSet(),
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: GestureDetector(
                      onTap: () {
                        widget.bloc.show(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("images/3.png"),
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              print(snapshot.error.toString());
            } else {
              print("no data");
              return Center(child: CircularProgressIndicator());
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
