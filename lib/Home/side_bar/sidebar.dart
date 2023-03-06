import 'package:flutter/material.dart';
import 'package:nss_jmieti/colors/colors.dart';

class sideBar extends StatefulWidget {
  const sideBar({super.key});

  @override
  State<sideBar> createState() => _sideBarState();
}

class _sideBarState extends State<sideBar> {
  int adcount = 10;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('NSS Community App'),
            accountEmail: Text('Developed in JMIETI, Radaur'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  'assets/front_screen/splash.png',
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: nssBlueColor,
            ),
          ),
          ListTile(
            leading: Icon(Icons.support),
            title: Text('Support Developers'),
            onTap: () {
              setState(() {
                adcount--;
              });
              if (adcount == 0) {
                // pending
              }
            },
            trailing: ClipOval(
              child: Container(
                  color: Colors.red,
                  width: 20,
                  height: 20,
                  child: Center(
                    child: Text(
                      '$adcount',
                      style: TextStyle(color: Colors.white, fontSize: 15.0),
                    ),
                  )),
            ),
          ),
          ListTile(
            leading: Icon(Icons.monetization_on_sharp),
            title: Text('Donate Developers'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.group_add_rounded),
            title: Text('About Developers'),
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => aboutDevs())),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.share),
            title: Text('Share this App'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.app_shortcut),
            title: Text('More Apps'),
            onTap: () => null,
          ),
          // ListTile(
          //   leading: Icon(Icons.align_vertical_bottom_rounded),
          //   title: Text('About App Version'),
          //   onTap: () => null,
          // ),
          Divider(),
          ListTile(
            leading: Icon(Icons.sentiment_satisfied_alt_sharp),
            title: Text('Send Feedback'),
            onTap: () => null,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () => null,
          ),
          SizedBox(
            height: 120,
          ),
          Container(
              height: 75,
              child: Image.asset(
                'assets/jmietixcreatify.png',
                //height: 90,
              )),
        ],
      ),
      shadowColor: textblack,
      elevation: 20.0,
      //width: 60,
    );
  }
}

// About developers
class aboutDevs extends StatelessWidget {
  const aboutDevs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('About Developers'),
      ),
      body: Container(
        child: Column(children: <Widget>[
          Row(
            children: [
              //   ListView(children: [
              //     Container(child: Text('A')),
              //     Container(child: Text('B')),
              //     Container(),
              //   ]),
            ],
          ),
        ]),
      ),
    );
  }
}
