import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:nss_jmieti/UI/colors/colors.dart';
import 'package:nss_jmieti/Auth/login.dart';

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
          // ListTile(
          //   leading: Icon(Icons.monetization_on_sharp),
          //   title: Text('Donate Developers'),
          //   onTap: () => null,
          // ),
          ListTile(
            leading: Icon(Icons.group_add_rounded),
            title: Text('About Developers'),
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => aboutDevs())),
          ),
          // Divider(),
          // ListTile(
          //   leading: Icon(Icons.share),
          //   title: Text('Share this App'),
          //   onTap: () => null,
          // ),
          // ListTile(
          //   leading: Icon(Icons.app_shortcut),
          //   title: Text('More Apps'),
          //   onTap: () => null,
          // ),
          // ListTile(
          //   leading: Icon(Icons.align_vertical_bottom_rounded),
          //   title: Text('About App Version'),
          //   onTap: () => null,
          // ),
          // Divider(),
          // ListTile(
          //   leading: Icon(Icons.sentiment_satisfied_alt_sharp),
          //   title: Text('Send Feedback'),
          //   onTap: () => null,
          // ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Log out'),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => LoginPage()));
            },
          ),
          //Divider(),
          SizedBox(
            height: 350,
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
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri(scheme: 'https', host: url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'can not launch url';
    }
  }
  //const aboutDevs({super.key});
  // final Uri _url1 = Uri.parse('https://www.linkedin.com/in/mayank-7a90b2178/');
  // final Uri _url2 =
  //     Uri.parse('https://www.linkedin.com/in/manu-kumar-pal-28197a220/');
  // final Uri _url3 =
  //     Uri.parse('https://www.linkedin.com/in/mridul-vij-31969b160/');
  // Future<void> _mayankUrl() async {
  //   if (!await launchUrl(_url1)) {
  //     throw Exception('Could not launch $_url1');
  //   }
  // }

  // Future<void> _manuUrl() async {
  //   if (!await launchUrl(_url2)) {
  //     throw Exception('Could not launch $_url2');
  //   }
  // }

  // Future<void> _mridulUrl() async {
  //   if (!await launchUrl(_url3)) {
  //     throw Exception('Could not launch $_url3');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgnd,
      appBar: AppBar(
        elevation: 0.0,
        title: Text('About Developers'),
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          SizedBox(height: 10),
          Center(
            child: Container(
              width: 370,
              decoration: BoxDecoration(
                  color: whitetext,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1, color: Colors.grey)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          margin: EdgeInsets.all(5),
                          padding: EdgeInsets.all(5),
                          height: 170,
                          width: 170,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          child: Image.asset('assets/mayank.jpg')),
                      Container(
                          margin: EdgeInsets.all(5),
                          padding: EdgeInsets.all(5),
                          height: 170,
                          width: 170,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          child: Image.asset('assets/manu.jpg')),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('   Mayank Saini',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: nssBlueColor)),
                      SizedBox(width: 40),
                      Text('         Manu Kumar Pal',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: nssBlueColor)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          '(Mern Stack Developer)\n             Builded:\n   Web Version of NSS',
                          style: TextStyle(fontSize: 15)),
                      SizedBox(width: 50),
                      Text(
                          '   (Mern Stack Developer)\n               Builded:\n      Web Version of NSS',
                          style: TextStyle(fontSize: 15)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/mern.jpg',
                        height: 40,
                        //width: 100,
                        //alignment: Alignment.center,
                      ),
                      SizedBox(width: 75),
                      Image.asset(
                        'assets/mern.jpg',
                        height: 40,
                        //width: 100,
                        //alignment: Alignment.center,
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          _launchURL('www.linkedin.com/in/mayank-7a90b2178/');
                        },
                        // splashColor: Colors.black,
                        // focusColor: Colors.black,
                        // hoverColor: Colors.black,
                        child: Image.asset(
                          'assets/linkedin.jpg',
                          width: 80,
                          //height: 80,
                        ),
                      ),
                      SizedBox(width: 111),
                      GestureDetector(
                          onTap: () {
                            _launchURL(
                                'www.linkedin.com/in/manu-kumar-pal-28197a220/');
                          },
                          child: Image.asset(
                            'assets/linkedin.jpg',
                            width: 80,
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
          Divider(indent: 20, endIndent: 20),
          Container(
            width: 200,
            decoration: BoxDecoration(
                color: whitetext,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1, color: Colors.grey)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        width: 170,
                        height: 170,
                        margin: EdgeInsets.all(10),
                        child: Image.asset('assets/mridul.jpg')),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Mridul Vij',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: nssBlueColor)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        '         (Flutter Developer)\n        Founder at @Creatify\n Builded: App Version of NSS',
                        style: TextStyle(fontSize: 15)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/flutter.png',
                      height: 40,
                      //width: 100,
                      //alignment: Alignment.center,
                    ),
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _launchURL('www.linkedin.com/in/mridul-vij-31969b160/');
                      },
                      // splashColor: Colors.black,
                      // focusColor: Colors.black,
                      // hoverColor: Colors.black,
                      child: Image.asset(
                        'assets/linkedin.jpg',
                        width: 80,
                        //height: 80,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
