//DashBoard for NSS

//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:nss_jmieti/feed_data/homefeed.dart';
//import 'package:nss_jmieti/screens/post.dart';
import 'package:nss_jmieti/screens/profile.dart';
import '/colors/colors.dart';
import 'package:nss_jmieti/Home/side_bar/sidebar.dart';

import 'notifications.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  int _currentIndex = 0;
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
        child: SingleChildScrollView(
          // call homefeed(); method here
          child: feedPosts(),
        ),
      ),
      //bottomNavigationBar: BottomNav(),
    );
  }
}