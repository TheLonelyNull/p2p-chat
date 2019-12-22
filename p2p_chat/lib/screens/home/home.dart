import 'package:flutter/material.dart';
import 'package:p2p_chat/screens/screens.dart';
import 'widgets.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  final Color _drawerColour = Color.fromARGB(255, 62, 67, 91);

  @override
  Widget build(BuildContext context) {
    final _tabPages = <Widget>[
      ChatOverviewScreen(),
      CallsScreen(),
      ContactScreen()
    ];

    final _tabs = <Tab>[
      Tab(icon: Icon(Icons.chat), text: "Chats"),
      Tab(icon: Icon(Icons.call), text: "Calls"),
      Tab(icon: Icon(Icons.contacts), text: "Contacs")
    ];

    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
          key: _key,
          appBar: AppBar(
            title: Text('P2P chat'),
            backgroundColor: Color.fromARGB(255, 62, 67, 91),
            leading: IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  _key.currentState.openDrawer();
                }),
            bottom: TabBar(tabs: _tabs),
          ),
          drawer: _buildDrawer(),
          body: TabBarView(children: _tabPages)),
    );
  }

  _buildDrawer() {
    return ClipPath(
      clipper: OvalClipper(),
      child: Drawer(
        child: Container(
          padding: const EdgeInsets.only(left: 16, right: 40),
          decoration: BoxDecoration(
              color: _drawerColour,
              boxShadow: [BoxShadow(color: Colors.black45)]),
          width: 300,
          child: SafeArea(
              child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 40,
                ),
                Container(
                  height: 90,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.lightBlueAccent, shape: BoxShape.circle),
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 75,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                _buildRow(Icons.person, "Change Profile Photo", "/editProfile"),
                _buildDivider(),
                _buildRow(Icons.share, "Share Profile", "/shareProfile"),
                _buildDivider(),
                _buildRow(Icons.lock, "Edit Encryption Keys", "/editKeys"),
                _buildDivider(),
                _buildRow(Icons.network_check, "Network Settings", "/networkSettings"),
                _buildDivider(),
                _buildRow(Icons.insert_chart, "Statistics", "/stats")
              ],
            ),
          )),
        ),
      ),
    );
  }

  _buildRow(IconData icon, String title, String navigationRoute) {
    final TextStyle textStyle = TextStyle(color: Colors.white, fontSize: 16);
    return InkWell(
      onTap: () {
        //todo navigate to the correct screen
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: <Widget>[
            Icon(icon, color: Colors.white),
            SizedBox(width: 10),
            Text(title, style: textStyle)
          ],
        ),
      ),
    );
  }

  _buildDivider() {
    return Divider(color: Colors.white);
  }
}

