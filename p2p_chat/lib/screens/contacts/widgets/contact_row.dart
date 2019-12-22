import 'package:flutter/material.dart';
import 'package:p2p_chat/util_widgets/util_widgets.dart';

class ContactWidget extends StatelessWidget {
  String username;
  String profilePhotoURL;

  ContactWidget({Key key, this.username, this.profilePhotoURL})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: (){},
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
                SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(this.username,
                        style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(
                  width: 40,
                ),
                IconButton(
                  icon: Icon(Icons.chat),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.call),
                  onPressed: (){},
                )
              ],
            )),
      ),
    );
  }
}
