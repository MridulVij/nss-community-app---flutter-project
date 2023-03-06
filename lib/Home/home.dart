//DashBoard for NSS

import 'dart:html';

import 'package:flutter/material.dart';
import '../colors/colors.dart';
import 'package:nss_jmieti/Home/side_bar/sidebar.dart';

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
            // decoration: BoxDecoration(
            //     borderRadius: BorderRadius.horizontal(
            //         left: Radius.circular(20), right: Radius.circular(20)),
            //     color: primaryred),
            // //height: ,
            padding: EdgeInsets.fromLTRB(90, 10, 90, 0),
            //margin: EdgeInsets.all(10),
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
                        // width: 40,
                      ),
                      Text(' NSS FEED',
                          style: TextStyle(fontSize: 26, color: whitetext)),
                    ],
                  ),
                  Center(
                    child: Container(
                      // decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(10),
                      //     color: primaryred),
                      //height: 2,
                      //width: 90,
                      //margin: EdgeInsets.only(bottom: 4),
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

        //leading: Icon(Icons.menu),
        // side bar is pending to build
        //foregroundColor: Colors.amber,
        elevation: 0.0,
        //titleSpacing: 0,
        // title: Text(
        //   'NSS Community',
        //   style: TextStyle(
        //     fontSize: 25.0,
        //   ),
        // ),
        //shape:
        //  BeveledRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: whitetext,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        iconSize: 25,
        elevation: 0.0,

        //unselectedFontSize: 15,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            // backgroundColor: nssBlueColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_rounded),
            label: 'Post',
            // backgroundColor: nssBlueColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_sharp),
            label: 'Notifications',
            //backgroundColor: theme,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
            //backgroundColor: theme,
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
