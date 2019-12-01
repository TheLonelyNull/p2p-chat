import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  LoadingScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => LoadingScreenState();
}

class LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 62, 67, 91),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FlareActor(
          'assets/Connecting.flr',
          animation: 'Searching',
        ),
      )),
    );
  }
}
