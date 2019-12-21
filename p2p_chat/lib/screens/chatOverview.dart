import 'package:flutter/material.dart';
import 'package:badges/badges.dart';

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
          child: Icon(Icons.add),
          onPressed: () {
            //todo
          }),
    );
  }
}

class ChatPreviewWidget extends StatelessWidget {
  String username;
  String previewText;
  int unreadCount;
  String profileImageURL;

  ChatPreviewWidget(
      {Key key,
      this.username,
      this.previewText,
      this.unreadCount,
      this.profileImageURL})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _unreadCountString = this.unreadCount.toString();
    if (this.unreadCount > 99) {
      _unreadCountString = "99+";
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Color(0xFF565973), width: 0.2),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              TextCircleWidget(color: Colors.blueAccent, text: "CR"),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(this.username,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text(this.previewText)
                ],
              ),
              SizedBox(
                width: 40,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Badge(
                    badgeContent: Text(
                      _unreadCountString,
                      style: TextStyle(color: Colors.white),
                    ),
                    badgeColor: Colors.blueAccent,
                    padding: EdgeInsets.all(8),
                  )
                ],
              )
            ],
          )),
    );
  }
}

class TextCircleWidget extends StatelessWidget {
  Color color;
  String text;

  TextCircleWidget({Key key, this.color, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        height: 90,
        alignment: Alignment.center,
        decoration: BoxDecoration(color: this.color, shape: BoxShape.circle),
        child: Text(this.text,
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white)));
  }
}
