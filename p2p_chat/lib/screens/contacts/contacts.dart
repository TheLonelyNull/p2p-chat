import 'package:flutter/material.dart';
import 'widgets.dart';

class ContactScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ContactScreenState();
}

class ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.person_add),
      ),
      body: ListView(
        children: <Widget>[
          ContactWidget(username: "Christoff Rossouw", profilePhotoURL: "",)
        ],
      ),
    );
  }
}

