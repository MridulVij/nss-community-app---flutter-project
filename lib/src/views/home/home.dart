//DashBoard for NSS
import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import 'package:nss_jmieti/src/views/home/sidebar/other/sidebar.dart';

import 'scroll_feed/feedposts.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  int myIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const sideBar(),
      backgroundColor: whitetext,
      appBar: AppBar(
        actions: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 60, 0),
            padding: const EdgeInsets.fromLTRB(80, 10, 90, 0),
            child: Center(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      // image of logo
                    ],
                  ),
                  Center(
                    child: Container(
                      child: const Text('National Service Scheme',
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
          children: const [
            //
            feedPosts(),
            feedPosts(),
            //
          ],
        ),
      ),
    );
  }
}
