//DashBoard for NSS

//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:nss_jmieti/UI/feedposts.dart';
import 'package:nss_jmieti/UI/bottom_bar/profile.dart';
import '../colors/colors.dart';
import 'package:nss_jmieti/UI/upper_bar/sidebar.dart';
//import 'notifications.dart';
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
            margin: EdgeInsets.fromLTRB(0, 0, 60, 0),
            padding: EdgeInsets.fromLTRB(80, 10, 90, 0),
            child: Center(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/front_screen/nss.png',
                        height: 30,
                      ),
                      Text(' NSS',
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
        ],
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          // call homefeed();
          children: [
            // we have to automate this
            feedPosts(),
            feedPosts(),
            feedPosts(),
            feedPosts(),
            feedPosts(),
            feedPosts(),
            feedPosts(),
            feedPosts(),
            feedPosts(),
            feedPosts(),
            feedPosts(),
          ],
        ),
        //Banner Ad Code
        // Container(
        //   alignment: Alignment.center,
        //   width: myBanner.size.width.toDouble(),
        //   height: myBanner.size.height.toDouble(),
        //   child: AdWidget(ad: myBanner),
        // )
      ),
    );
  }
}
