//DashBoard for NSS

//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:nss_jmieti/feed_data/homefeed.dart';
import 'package:nss_jmieti/screens/profile.dart';
import '/colors/colors.dart';
import 'package:nss_jmieti/Home/side_bar/sidebar.dart';
import 'notifications.dart';
//import 'package:ourads/ourads.dart';
//import 'package:google_mobile_ads/google_mobile_ads.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  int myIndex = 0;
  //Banner Ad Code

  // final BannerAd myBanner = BannerAd(
  //   adUnitId: 'ca-app-pub-3940256099942544/6300978111',
  //   size: AdSize.banner,
  //   request: AdRequest(),
  //   listener: BannerAdListener(),
  // );
  //end

  // @override
  // void initState() {
  //   super.initState();
  //   myBanner.load();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: sideBar(),
      backgroundColor: whitetext,
      appBar: AppBar(
        actions: [
          Container(
            padding: EdgeInsets.fromLTRB(90, 10, 90, 0),
            child: Center(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/front_screen/nss.png',
                        height: 30,
                      ),
                      Text(' NSS FEED',
                          style: TextStyle(fontSize: 26, color: whitetext)),
                    ],
                  ),
                  Center(
                    child: Container(
                      child: Text('National Service Scheme',
                          style: TextStyle(fontSize: 11)),
                    ),
                  )
                ],
              ),
            ),
          ),
          PopupMenuButton(
              itemBuilder: (context) => [
                    PopupMenuItem(
                      child: Text('Follow Us'),
                      value: 1,
                    ),
                    PopupMenuItem(
                      child: Text('More Apps'),
                      value: 1,
                    ),
                    PopupMenuItem(
                      value: 2,
                      child: Text('Send Feedback'),
                    ),
                    PopupMenuItem(
                      child: Text('Share App with friends'),
                      value: 1,
                    ),
                  ])
        ],
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            SingleChildScrollView(
              // call homefeed();
              child: feedPosts(),
            ),
            //Banner Ad Code
            // Container(
            //   alignment: Alignment.center,
            //   width: myBanner.size.width.toDouble(),
            //   height: myBanner.size.height.toDouble(),
            //   child: AdWidget(ad: myBanner),
            // )
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   onTap: (index) {
      //     setState(() {
      //       myIndex = index;
      //     });
      //   },
      //   backgroundColor: whitetext,
      //   currentIndex: myIndex,
      //   type: BottomNavigationBarType.fixed,
      //   iconSize: 25,
      //   elevation: 0.0,
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.add_box_rounded),
      //       label: 'Post',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.notifications_sharp),
      //       label: 'Notifications',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.account_circle),
      //       label: 'Profile',
      //     ),
      //   ],
      // ),
    );
  }
}
