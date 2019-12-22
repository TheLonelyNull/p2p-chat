import 'package:flutter/material.dart';
import 'widgets.dart';

class CallsScreen extends StatelessWidget {
  CallsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.add_call), onPressed: () {}),
      body: ListView(
        children: <Widget>[
          CallLogWidget(username: "Christoff Rossouw", profileImageURL: "", callDate: DateTime.now(),)
        ],
      ),
    );
  }
}