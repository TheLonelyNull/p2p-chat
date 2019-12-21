import 'package:flutter/material.dart';

class TextCircleWidget extends StatelessWidget {
  final Color color;
  final String text;

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
