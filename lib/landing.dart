import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/api/api.dart';
import 'package:task/blocs/home_bloc.dart';
import 'package:task/screens/home.dart';

class Landing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final api = Provider.of<APiBase>(context, listen: false);
    return Provider<HomeBloc>(
      create: (context) => HomeBloc(api: api),
      child:
          Consumer<HomeBloc>(builder: (context, bloc, _) => Home(bloc: bloc)),
      dispose: (context, bloc) => bloc.dispose(),
    );
  }
}
