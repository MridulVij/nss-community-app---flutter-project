//import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
//import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:nss_jmieti/src/constants/colors.dart';
import 'package:nss_jmieti/src/views/auth/login_view.dart';
import 'package:nss_jmieti/src/views/home/sidebar/other/app_guide.dart';

class sideBar extends StatefulWidget {
  const sideBar({super.key});

  @override
  State<sideBar> createState() => _sideBarState();
}

class _sideBarState extends State<sideBar> {
  int adcount = 5;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shadowColor: textblack,
      elevation: 20.0,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('NSS JMIETI COMMUNITY'),
            accountEmail: const Text('Developed in JMIETI, Radaur'),
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
            decoration: const BoxDecoration(
              color: nssBlueColor,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.feedback),
            title: const Text('Send Feedback'),
            onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const sendFeedback())),
          ),
          // problem on webview
          ListTile(
            leading: const Icon(Icons.help),
            title: const Text('App Guide'),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const WebViewScreen2())),
          ),
          ListTile(
            leading: const Icon(Icons.support),
            title: const Text('Support Developers'),
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
                      style:
                          const TextStyle(color: Colors.white, fontSize: 15.0),
                    ),
                  )),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.android),
            title: const Text('About Developers'),
            onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const aboutDevs())),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.logout,
              color: Colors.red,
            ),
            title: const Text('Log out', style: TextStyle(color: Colors.red)),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const LoginPage()));
            },
          ),
        ],
      ),
      //width: 60,
    );
  }
}

//Send Feedback
class sendFeedback extends StatelessWidget {
  const sendFeedback({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Submit Feedback'),
        elevation: 0.0,
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            //width: ,
            //height: 100,
            child: TextFormField(
              // style: TextStyle(fontSize: 200),
              maxLines: 10,
              minLines: 10,
              decoration: InputDecoration(
                hintText: 'Add a Feedback',
                //contentPadding: EdgeInsets.symmetric(vertical: 90),

                border: OutlineInputBorder(
                  borderSide: const BorderSide(width: 0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
            width: 380,
            child:
                ElevatedButton(onPressed: () {}, child: const Text('Submit')))
      ]),
    );
  }
}

// App Guide
//import 'package:flutter/material.dart';
//import 'package:webview_flutter/webview_flutter.dart';
// import '../Home/side_bar/sidebar.dart';
// import '../colors/colors.dart';

// About developers
class aboutDevs extends StatelessWidget {
  const aboutDevs({super.key});

  Future<void> _launchURL(String url) async {
    // if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    //   throw 'can not launch url';
    // }
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
        title: const Text('About Developers'),
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          const SizedBox(height: 10),
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
                          margin: const EdgeInsets.all(5),
                          padding: const EdgeInsets.all(5),
                          height: 170,
                          width: 170,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          child: Image.asset('assets/mayank.jpg')),
                      Container(
                          margin: const EdgeInsets.all(5),
                          padding: const EdgeInsets.all(5),
                          height: 170,
                          width: 170,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          child: Image.asset('assets/manu.jpg')),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
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
                    children: const [
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
                      const SizedBox(width: 75),
                      Image.asset(
                        'assets/mern.jpg',
                        height: 40,
                        //width: 100,
                        //alignment: Alignment.center,
                      ),
                    ],
                  ),
                  const Divider(),
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
                      const SizedBox(width: 111),
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
          const Divider(indent: 20, endIndent: 20),
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
                        margin: const EdgeInsets.all(10),
                        child: Image.asset('assets/mridul.jpg')),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('Mridul Vij',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: nssBlueColor)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
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
                const Divider(),
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
