import 'package:flutter/material.dart';
import 'widgets.dart';

class ChatOverviewScreen extends StatefulWidget {
  ChatOverviewScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ChatOverviewState();
}

class ChatOverviewState extends State<ChatOverviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          ChatPreviewWidget(
              unreadCount: 113,
              username: "Christoff Rossouw",
              previewText: "Hi there",
              profileImageURL: null),
          ChatPreviewWidget(
              unreadCount: 113,
              username: "Christoff Rossouw",
              previewText: "Hi there",
              profileImageURL: null),
          ChatPreviewWidget(
              unreadCount: 113,
              username: "Christoff Rossouw",
              previewText: "Hi there",
              profileImageURL: null),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.chat),
          onPressed: () {
            //todo
          }),
    );
  }
}