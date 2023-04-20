//DashBoard for NSS
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nss_jmieti/UI/feedposts.dart';
import 'package:nss_jmieti/UI/bottom_bar/profile.dart';
import '../colors/colors.dart';
import 'package:nss_jmieti/UI/upper_bar/sidebar.dart';
import 'package:nss_jmieti/UI/bottom_bar/home_models.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
//import 'package:flutter/src/widgets/image.dart;

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
      drawer: sideBar(),
      backgroundColor: whitetext,
      appBar: AppBar(
        actions: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 60, 0),
            padding: EdgeInsets.fromLTRB(80, 10, 90, 0),
            child: Center(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // image of logo
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
      body: Column(
        // call homefeed();
        children: [
          //
          Expanded(
              child: FutureBuilder(
            future: allpostfetch(),
            builder: (context, AsyncSnapshot<List<PostsModel>> snapshot) {
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              } else {
                return ListView.builder(
                  itemCount: userList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Column(children: [
                        //
                      ]),
                    );
                  },
                );
              }
            },
          )),
          //
        ],
      ),
    );
  }

  // api integration
  List<PostsModel> userList = [];

  Future<List<PostsModel>> allpostfetch() async {
    final response =
        await http.get(Uri.parse('https://nssjmieti.onrender.com/post/posts'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        print(i['name']);
        userList.add(PostsModel.fromJson(i));
      }
      return userList;
    } else {
      return userList;
    }
  }
  //
}
